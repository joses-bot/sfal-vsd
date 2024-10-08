set NDM_LIBS {}
set FRAME_LIBS {}
set LEF_FILES {/home/jose/VSDBabySoC_ICC2/avsddac.lef}
set DB_FILES {/home/jose/synopsys_ICC2flow_130nm/synopsys_skywater_flow_nominal/collateral/avsddac.db}
set TECH_FILE "/home/jose/synopsys_ICC2flow_130nm/synopsys_skywater_flow_nominal/collateral/sky130_fd_sc_hd.tf"

set_app_options -name lib.workspace.create_cached_lib -value true
#suppress_messages

set_app_options -name lib.workspace.allow_read_aggregate_lib -value true
create_workspace avsddac -technology $TECH_FILE -scale_factor 10000
read_lef $LEF_FILES
read_db $DB_FILES
process_workspaces -check_options {-allow_missing} -force -directory CLIBs -output avsddac.ndm
