set libfiles [glob /home/jose/VSDBabySoC/src/lib/sky*.db]
foreach f $libfiles {
set fblib [file rootname [file tail $f]]

set target_library $f
set link_library [concat * $target_library \ /home/jose/VSDBabySoC/src/lib/avsdpll.db \  /home/jose/VSDBabySoC/src/lib/avsddac.db]
set search_path {/home/jose/VSDBabySoC/src/include /home/jose/VSDBabySoC/src/module}
read_file {sandpiper_gen.vh  sandpiper.vh  sp_default.vh  sp_verilog.vh clk_gate.v rvmyth.v rvmyth_gen.v vsdbabysoc.v} -autoread -top vsdbabysoc
link
read_sdc /home/jose/VSDBabySoC/src/sdc/vsdbabysoc_synthesis.sdc
compile_ultra
set bnet "/home/jose/VSDBabySoC/output/vsdbabysoc_net_${fblib}.v"
set brep "/home/jose/VSDBabySoC/report/report_qor_${fblib}.txt"
set trep "/home/jose/VSDBabySoC/report/report_timing_${fblib}.txt"


set crep "/home/jose/VSDBabySoC/report/report_clock_${fblib}.txt"
set constr "/home/jose/VSDBabySoC/report/report_constraint_${fblib}.txt"

set wns_file "/home/jose/VSDBabySoC/report/wns_${fblib}.txt"
set whs_file "/home/jose/VSDBabySoC/report/whs_${fblib}.txt"


write_file -format verilog -hierarchy -output $bnet
report_qor > $brep
report_timing > $trep

set wns [get_attribute [get_timing_paths -delay_type max -max_paths 1] slack]
set whs [get_attribute [get_timing_paths -delay_type min -max_paths 1] slack]

echo $wns > $wns_file
echo $whs > $whs_file

report_clock > $crep
report_constraint  > $constr
reset_design
remove_design -all

}


