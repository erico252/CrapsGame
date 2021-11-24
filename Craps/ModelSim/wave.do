onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label A /testbench/A


add wave -noupdate -divider NAME

configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {250 ns}