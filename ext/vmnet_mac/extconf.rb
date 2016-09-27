require 'mkmf'

$libs += "-framework vmnet"
extension_name = 'vmnet_mac'
dir_config(extension_name)
create_makefile(extension_name)


