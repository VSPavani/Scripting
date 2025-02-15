open_project [pwd]/Automation/Project_1.xpr 
set_property source_mgmt_mode None [current_project]
update_compile_order -fileset sources_1 
##open the created vivado project
 

#looping over all the top modules and running the synthesis and implementation
 
set_property top [string trimright [lindex $argv 0] ".v"] [current_fileset]
set_property source_mgmt_mode None [current_project]
update_compile_order -fileset sources_1

# reset and launch the synthesis and implementation. THe process waits till next command is executed

reset_run synth_1  
launch_runs synth_1 -jobs 20
wait_on_run synth_1
    

reset_run impl_1
launch_runs impl_1 -jobs 20
wait_on_run impl_1


open_run impl_1
report_power > results2/[string trimright [lindex $argv 0] ".v"]/power.txt
report_timing > results2/[string trimright [lindex $argv 0] ".v"]/timing.txt
report_utilization > results2/[string trimright [lindex $argv 0] ".v"]/utilization.txt
update_compile_order -fileset sources_1

close_project
