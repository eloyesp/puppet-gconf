module Puppet::Parser::Functions
	newfunction(:str_to_ints, :type => :rvalue) do |args|
		(args[0].split('').map {|c| c[0]}).join(',')
	end
end
