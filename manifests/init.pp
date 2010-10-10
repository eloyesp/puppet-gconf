define gconf_value($value, $type="string", $source="/etc/gconf/gconf.xml.defaults") {
	exec {"set $name to $value":
		command => "gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s --type=$type $name \"$value\"",
		path => "/usr/bin"
	}
}

define gconf_list($value, $ltype="string", $source="/etc/gconf/gconf.xml.defaults") {
	exec {"set $name to $values":
		command => "gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s --type=list --list-type=$ltype $name [$values]",
		path => "/usr/bin"
	}
}

define gconf($value, $type="string", $ltype="string", $source="/etc/gconf/gconf.xml.defaults") {
	debug "Setting $name to $value;type=$type, ltype=$ltype"
	case $type {
		list: { gconf_list { $name:
			value => $value,
			ltype => $ltype
		}}
		default: { gconf_value { $name:
			value => $value,
			type => $type
		}}
	}
}
