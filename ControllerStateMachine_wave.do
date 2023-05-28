onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ControllerStateMachine_tb/Clk
add wave -noupdate /ControllerStateMachine_tb/instruction
add wave -noupdate /ControllerStateMachine_tb/Rst
add wave -noupdate /ControllerStateMachine_tb/ALUSelect
add wave -noupdate /ControllerStateMachine_tb/CurrentStateOut
add wave -noupdate /ControllerStateMachine_tb/DAddr
add wave -noupdate /ControllerStateMachine_tb/DWrite
add wave -noupdate /ControllerStateMachine_tb/IRLd
add wave -noupdate /ControllerStateMachine_tb/NextStateOut
add wave -noupdate /ControllerStateMachine_tb/PCClr
add wave -noupdate /ControllerStateMachine_tb/PCUp
add wave -noupdate /ControllerStateMachine_tb/RFAReadAddr
add wave -noupdate /ControllerStateMachine_tb/RFBReadAddr
add wave -noupdate /ControllerStateMachine_tb/RFSelect
add wave -noupdate /ControllerStateMachine_tb/RFWriteAddr
add wave -noupdate /ControllerStateMachine_tb/RFWriteEnable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0            
configure wave -namecolwidth 150        
configure wave -valuecolwidth 100       
configure wave -justifyvalue left       
configure wave -signalnamewidth 0       
configure wave -snapdistance 10         
configure wave -datasetprefix 0         
configure wave -rowmargin 4             
configure wave -childrowmargin 2        
configure wave -gridoffset 0            
configure wave -gridperiod 1            
configure wave -griddelta 40            
configure wave -timeline 0              
configure wave -timelineunits ps        
update                                  
WaveRestoreZoom {0 ps} {1 ns}          