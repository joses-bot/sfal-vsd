create_clock [get_pins pll/CLK] -name clk -period 10 -waveform {0 5}
set_load -pin_load 0.3 [get_ports OUT]
set_load -min -pin_load 0.3 [get_ports OUT]
set_propagated_clock [all_clocks]

set_max_transition  5.0  [current_design]
set_max_capacitance 0.03 [current_design]

#set_clock_latency 1 [get_clocks clk]
#set_clock_latency -source 2 [get_clocks clk]
set_clock_uncertainty 0.1 -setup [get_clocks clk]
set_clock_uncertainty 0.1 -hold [get_clocks clk]
#set_max_delay 2 -from [get_pins dac/OUT] -to [get_ports OUT]
#set_input_delay -clock clk -max 1 [get_ports VCO_IN]
#set_input_delay -cloc clk -min 0.5  [get_ports VCO_IN]
#set_input_delay -clock clk -max 1 [get_ports ENb_CP]
#set_input_delay -clock clk -min 0.5 [get_ports ENb_CP]
set_input_transition -max  0.4 [get_ports VCO_IN]
set_input_transition -min  0.1 [get_ports VCO_IN]
set_input_transition -max  0.4 [get_ports ENb_CP]
set_input_transition -min  0.1 [get_ports ENb_CP]
#set_max_area 30000 
