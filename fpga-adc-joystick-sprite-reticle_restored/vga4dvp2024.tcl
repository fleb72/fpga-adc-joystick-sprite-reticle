# Copyright (C) 2023  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: vga4dvp2024.tcl
# Generated on: Wed Mar  6 21:37:02 2024

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "vga4dvp2024"]} {
		puts "Project vga4dvp2024 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists vga4dvp2024]} {
		project_open -revision vga4dvp2024 vga4dvp2024
	} else {
		project_new -revision vga4dvp2024 vga4dvp2024
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone IV E"
	set_global_assignment -name DEVICE EP4CE22F17C6
	set_global_assignment -name TOP_LEVEL_ENTITY Block_main
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 12.0
	set_global_assignment -name LAST_QUARTUS_VERSION "22.1std.2 Lite Edition"
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "12:51:12 FEBRUARY 28,2024"
	set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 256
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6
	set_global_assignment -name NUM_PARALLEL_PROCESSORS 8
	set_global_assignment -name ENABLE_OCT_DONE OFF
	set_global_assignment -name ENABLE_CONFIGURATION_PINS OFF
	set_global_assignment -name ENABLE_BOOT_SEL_PIN OFF
	set_global_assignment -name USE_CONFIGURATION_DEVICE OFF
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF
	set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"
	set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -rise
	set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -fall
	set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -rise
	set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -fall
	set_global_assignment -name VERILOG_FILE Block_sinus.v
	set_global_assignment -name SDC_FILE vga4dvp2024.SDC
	set_global_assignment -name SYSTEMVERILOG_FILE vga_sync.sv
	set_global_assignment -name BDF_FILE Block_main.bdf
	set_global_assignment -name QIP_FILE pll.qip
	set_global_assignment -name SYSTEMVERILOG_FILE drawing_square.sv
	set_global_assignment -name QIP_FILE rom_sinus_table.qip
	set_global_assignment -name SYSTEMVERILOG_FILE sinus_table.sv
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name VECTOR_WAVEFORM_FILE Waveform1.vwf
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_location_assignment PIN_R8 -to CLOCK_50
	set_location_assignment PIN_J15 -to KEY[0]
	set_location_assignment PIN_E1 -to KEY[1]
	set_location_assignment PIN_A8 -to GPIO0_IN[0]
	set_location_assignment PIN_D3 -to GPIO0[0]
	set_location_assignment PIN_B8 -to GPIO0_IN[1]
	set_location_assignment PIN_C3 -to GPIO0[1]
	set_location_assignment PIN_A2 -to GPIO0[2]
	set_location_assignment PIN_A3 -to GPIO0[3]
	set_location_assignment PIN_B3 -to GPIO0[4]
	set_location_assignment PIN_B4 -to GPIO0[5]
	set_location_assignment PIN_A4 -to GPIO0[6]
	set_location_assignment PIN_B5 -to GPIO0[7]
	set_location_assignment PIN_A5 -to GPIO0[8]
	set_location_assignment PIN_D5 -to GPIO0[9]
	set_location_assignment PIN_B6 -to GPIO0[10]
	set_location_assignment PIN_A6 -to GPIO0[11]
	set_location_assignment PIN_B7 -to GPIO0[12]
	set_location_assignment PIN_A7 -to GPIO0[14]
	set_location_assignment PIN_C8 -to GPIO0[16]
	set_location_assignment PIN_E7 -to GPIO0[18]
	set_location_assignment PIN_E8 -to GPIO0[20]
	set_location_assignment PIN_F9 -to GPIO0[22]
	set_location_assignment PIN_C9 -to GPIO0[24]
	set_location_assignment PIN_E11 -to GPIO0[26]
	set_location_assignment PIN_E10 -to VGA_HSYNC
	set_location_assignment PIN_D9 -to VGA_VSYNC
	set_location_assignment PIN_B11 -to VGA_B[3]
	set_location_assignment PIN_D11 -to VGA_G[3]
	set_location_assignment PIN_B12 -to VGA_R[3]
	set_location_assignment PIN_E9 -to VGA_R[2]
	set_location_assignment PIN_F8 -to VGA_G[2]
	set_location_assignment PIN_D8 -to VGA_B[2]
	set_location_assignment PIN_E6 -to VGA_R[1]
	set_location_assignment PIN_C6 -to VGA_G[1]
	set_location_assignment PIN_D6 -to VGA_B[1]
	set_location_assignment PIN_D12 -to VGA_R[0]
	set_location_assignment PIN_A12 -to VGA_G[0]
	set_location_assignment PIN_C11 -to VGA_B[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_IN[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_IN[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[10]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[11]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[12]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[14]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[16]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[18]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[20]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[22]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[24]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0[26]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_HSYNC
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_VSYNC
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[0]
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
