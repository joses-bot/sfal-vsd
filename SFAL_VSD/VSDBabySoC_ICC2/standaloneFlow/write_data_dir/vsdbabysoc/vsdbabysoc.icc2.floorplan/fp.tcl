################################################################################
#
# Created by icc2 write_floorplan on Tue Aug 27 10:49:55 2024
#
################################################################################


set _dirName__0 [file dirname [file normalize [info script]]]

################################################################################
# Rows
################################################################################

remove_site_arrays -all

remove_site_rows -all

################################################################################
# Pins
################################################################################

set __pins [get_terminals -quiet]
if {[sizeof_collection $__pins] > 0} {
set __termShapes [get_shapes -of_objects [get_terminals * -quiet] -quiet]
if {[sizeof_collection $__termShapes] > 0} {
remove_shapes $__termShapes -force
}
set __termVias [get_vias -of_objects [get_terminals * -quiet] -quiet]
if {[sizeof_collection $__termVias] > 0} {
remove_vias $__termVias -force
}
set __termShapePatterns [get_shape_patterns -of_objects [get_terminals * -quiet] -quiet]
if {[sizeof_collection $__termShapePatterns] > 0} {
remove_shape_patterns $__termShapePatterns
}
}

################################################################################
# Net shapes and vias
################################################################################

set __netshapes [get_shapes -quiet]
if {[sizeof_collection $__netshapes] > 0} {
remove_shapes $__netshapes -force
}

set __netShapePatterns [get_shape_patterns -quiet]
if {[sizeof_collection $__netShapePatterns] > 0} {
remove_shape_patterns $__netShapePatterns
}

set __vias [get_vias -quiet]
if {[sizeof_collection $__vias] > 0} {
remove_vias $__vias -force
}

################################################################################
# Read DEF
################################################################################

read_def  ${_dirName__0}/floorplan.def.gz

################################################################################
# Voltage areas
################################################################################

remove_voltage_areas -all



################################################################################
# User attributes of voltage areas
################################################################################

################################################################################
# Site arrays
################################################################################

create_site_array -name unit_row -site unit -default -boundary { {20.0000 20.0000} {1719.7000 969.2800} } -flip_first_row true -flip_alternate_row true -transparent false -direction horizontal -x_margin 0.0000 -y_margin 0.0000 -core_offset { 20.0000 20.0000 } -aligned true

################################################################################
# User attributes of site arrays
################################################################################


################################################################################
# Site rows cycle and offset attributes
################################################################################

################################################################################
# User attributes of site rows
################################################################################


################################################################################
# Keepouts
################################################################################

create_keepout_margin -type hard -outer { 0.3066 0.2124 0.3066 0.2124 } { pll }
create_keepout_margin -type hard -outer { 0.3066 0.2124 0.0000 0.2124 } { dac }

################################################################################
# User attributes of cells
################################################################################


################################################################################
# Bounds and user attributes of bound shapes
################################################################################

remove_bounds -all


################################################################################
# User attributes of bounds
################################################################################


################################################################################
# Pin guides
################################################################################

remove_pin_guides -all


################################################################################
# Route guides and their user attributes
################################################################################

remove_routing_guides -all



################################################################################
# Blockages
################################################################################

remove_routing_blockages -all -force

remove_placement_blockages -all -force

set blkg [ create_placement_blockage -name auto_generate_blockage0 -type soft -purpose system -boundary { {1716.3000 22.5076} {1719.7000 585.2424} } ]
set_attribute -objects $blkg -name is_derived -value true
set blkg [ create_placement_blockage -name auto_generate_blockage1 -type soft -purpose system -boundary { {517.5966 22.5076} {522.4234 36.6424} } ]
set_attribute -objects $blkg -name is_derived -value true
set blkg [ create_placement_blockage -name auto_generate_blockage2 -type soft -purpose system -boundary { {480.8034 20.0000} {1719.7000 22.5076} } ]
set_attribute -objects $blkg -name is_derived -value true


remove_pin_blockages -all

remove_shaping_blockages -all

################################################################################
# User attributes of blockages
################################################################################



################################################################################
# Module Boundaries
################################################################################

set hbCells [get_cells -quiet -filter hierarchy_type==boundary -hierarchical]
if [sizeof_collection $hbCells] {
   set_cell_hierarchy_type -type normal $hbCells
}


################################################################################
# User_shapes not written out by the def part
################################################################################

################################################################################
# Placment_Attractions
################################################################################

set _placementAttractions [get_placement_attractions * -quiet]
if [sizeof_collection $_placementAttractions] {
remove_placement_attractions $_placementAttractions -force
}

################################################################################
# User attributes of placement attractions
################################################################################


################################################################################
# Bump regions
################################################################################

remove_bump_regions -all

remove_pseudo_tsv_defs -all

remove_bump_regions -all

remove_bump_region_patterns -all

################################################################################
# set attributes of pseudo bumps
################################################################################

################################################################################
# set attributes of pseudo tsvs
################################################################################

################################################################################
# User attributes of bump region
################################################################################

################################################################################
# Bundles
################################################################################

set _bundles [get_bundles * -quiet]
if [sizeof_collection $_bundles] {
remove_bundles $_bundles
}


################################################################################
# User attributes of bundles
################################################################################


################################################################################
# I/O guides
################################################################################

remove_io_guides -all


################################################################################
# User attributes of I/O guides
################################################################################


################################################################################
# Edit groups
################################################################################

remove_edit_groups -all -force


################################################################################
# User attributes of edit groups
################################################################################


################################################################################
# PG regions
################################################################################

remove_pg_regions -all


################################################################################
# User attributes of pg regions
################################################################################


################################################################################
# Routing corridors
################################################################################

remove_routing_corridors -all


################################################################################
# Routing directions
################################################################################

set_attribute -objects [get_layers li1] -name routing_direction -value vertical
set_attribute -objects [get_layers met1] -name routing_direction -value horizontal
set_attribute -objects [get_layers met2] -name routing_direction -value vertical
set_attribute -objects [get_layers met3] -name routing_direction -value horizontal
set_attribute -objects [get_layers met4] -name routing_direction -value vertical
set_attribute -objects [get_layers met5] -name routing_direction -value horizontal

################################################################################
# Tracks and their user attributes
################################################################################

remove_tracks -all

set track [create_track -layer li1 -count 2151 -dir Y -space 0.4600 -coord 0.2200 -bbox {{0.0000 0.2200 } {1739.7000 989.2200 }}]
set track [create_track -layer li1 -count 3782 -dir X -space 0.4600 -coord 0.2200 -bbox {{0.2200 0.0000 } {1739.4800 989.2800 }}]
set track [create_track -layer met1 -count 2909 -dir Y -space 0.3400 -coord 0.2800 -bbox {{0.0000 0.2800 } {1739.7000 989.0000 }}]
set track [create_track -layer met1 -count 5116 -dir X -space 0.3400 -coord 0.2800 -bbox {{0.2800 0.0000 } {1739.3800 989.2800 }}]
set track [create_track -layer met2 -count 2151 -dir Y -space 0.4600 -coord 0.2200 -bbox {{0.0000 0.2200 } {1739.7000 989.2200 }}]
set track [create_track -layer met2 -count 3782 -dir X -space 0.4600 -coord 0.2200 -bbox {{0.2200 0.0000 } {1739.4800 989.2800 }}]
set track [create_track -layer met3 -count 1455 -dir Y -space 0.6800 -coord 0.2800 -bbox {{0.0000 0.2800 } {1739.7000 989.0000 }}]
set track [create_track -layer met3 -count 2558 -dir X -space 0.6800 -coord 0.2800 -bbox {{0.2800 0.0000 } {1739.0400 989.2800 }}]
set track [create_track -layer met4 -count 1075 -dir Y -space 0.9200 -coord 0.6800 -bbox {{0.0000 0.6800 } {1739.7000 988.7600 }}]
set track [create_track -layer met4 -count 1891 -dir X -space 0.9200 -coord 0.6800 -bbox {{0.6800 0.0000 } {1739.4800 989.2800 }}]
set track [create_track -layer met5 -count 291 -dir Y -space 3.4000 -coord 3.0000 -bbox {{0.0000 3.0000 } {1739.7000 989.0000 }}]
set track [create_track -layer met5 -count 511 -dir X -space 3.4000 -coord 3.0000 -bbox {{3.0000 0.0000 } {1737.0000 989.2800 }}]

################################################################################
# Terminals/shapes/vias of ports with user attributes
################################################################################

################################################################################
# User attributes of ports
################################################################################


################################################################################
# Shapes and vias of net and their user attributes
################################################################################


################################################################################
# User attributes of routing rules
################################################################################


################################################################################
# User attributes of pins
################################################################################


################################################################################
# User attributes of nets
################################################################################


################################################################################
# Anchors
################################################################################

################################################################################
# User attributes of current block
################################################################################

set_attribute [current_design] expanded_util 0.03

