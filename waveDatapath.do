onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Datapath_tb/Clock
add wave -noupdate /Datapath_tb/D_Addr
add wave -noupdate /Datapath_tb/D_Wr
add wave -noupdate /Datapath_tb/RF_s
add wave -noupdate /Datapath_tb/RF_W_Addr
add wave -noupdate /Datapath_tb/RF_W_en
add wave -noupdate /Datapath_tb/RF_Ra_Addr
add wave -noupdate /Datapath_tb/RF_Rb_Addr
add wave -noupdate /Datapath_tb/ALU_s0
add wave -noupdate /Datapath_tb/ALU_inA
add wave -noupdate /Datapath_tb/ALU_inB
add wave -noupdate /Datapath_tb/ALU_out
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
