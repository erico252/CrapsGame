onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label A /testbench/A
add wave -noupdate -label B /testbench/B
add wave -noupdate -label Result /testbench/Result
add wave -noupdate -label Carry /testbench/Carry

add wave -noupdate -divider 1Bit-Adder

configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {200 ns} 