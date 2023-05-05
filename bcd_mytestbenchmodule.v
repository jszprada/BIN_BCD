module bcd_mytestbenchmodule();
	
reg CLK;
initial CLK  <= 0;
always #50  CLK <= ~CLK;
	
reg RST;
initial 
begin
	RST <= 0;
	RST <= #100 1;
	RST <= #500 0;
end	  

reg [31:0] i_dat;
reg i_stb;

initial 
begin
	i_dat <= 0;
	i_stb <= 0;
	#1000;	   
	i_dat <= 8;
	i_stb <= 1;
	#100;	  
	i_stb <= 0;
	
end	  

bin_to_bcd_simple test
( 
.CLK(CLK),
.RST(RST),

.I_DAT(i_dat), 
.I_STB(i_stb),

.O_DAT(), 
.O_STB()
);		

bin_to_bcd test2
( 
.CLK(CLK),
.RST(RST),

.I_DAT(i_dat), 
.I_STB(i_stb),

.O_DAT(), 
.O_STB()
);		


bcd_shl_1 test3
( 
.CLK(CLK),
.RST(RST),
.ADD1(), 
.DAT(), 
.OVERFLOW()
);		



endmodule

