#opens vivado project
open_project [pwd]/Automation/Project_1.xpr
#set_property board_part xilinx.com:ac701:part0:1.4 [current_project]


# loop to add all design files

add_files -norecurse [pwd]/scripting-and-automation/Modules/[lindex $argv 0]

#foreach module_name $argv {
#	add_files -norecurse [pwd]/scripting-and-automation/Modules/$module_name	
#}

#add_files -norecurse [pwd]/[lindex $argv 0]

update_compile_order -fileset sources_1

close_project
