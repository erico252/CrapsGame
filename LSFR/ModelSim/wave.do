onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Cycles /testbench/Cycles
add wave -noupdate -label Clock /testbench/Clock
add wave -noupdate -label Result /testbench/Result
add wave -noupdate -divider LFSR
add wave -noupdate -label CurrentInternal /testbench/U1/Current_InternalBits
add wave -noupdate -label NextInternal /testbench/U1/Next_InternalBits
add wave -noupdate -label CyclesCondition /testbench/U1/CyclesCondition

configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {100 ns}