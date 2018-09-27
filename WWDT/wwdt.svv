//WWDG (Window Watch Dog Timer)
// This watch dog timer will get prescaled clock from APB
// It is a 7-bit down counter

`include "interface.sv"

module wdt(
apb_if wdt_h, output reg wdt_intr);

//watch dog counter register
reg [31:0] wwdg_cr;
//watch dog configuration register
reg[31:0] wwdg_cfr;
//watch dog status register
//reg[31:0] wwdg_sr;
//watchdog activate/deactivate
//reg wdga;


always @(posedge wdt_h.pclk or wdt_h.presetn)
	if (wdt_h.presetn == 1'b0)
	begin
	   wwdg_cr <= 8'h 00; //Disable WWDT. bit 7 is enable/disable bit
           wwdg_cfr<= 7'h 00; //Make Compare window value 0 
   	   wdt_intr <= 0;	   
	end

	else if(wdt_h.penable == 1'b1 && wdt_h.psel==1'b1 && wdt_h.pwrite==1'b1)
	begin
	    case (wdt_h.paddr)
		    4'b0000 : wwdg_cr <= wdt_h.pwdata;
		    4'b0001 : wwdg_cfr <= wdt_h.pwdata;
	    endcase

        end	

//read
always @(posedge wdt_h.pclk)
	if(wdt_h.penable == 1'b1 && wdt_h.psel==1'b1 && wdt_h.pwrite==1'b0)
	begin
	    case (wdt_h.paddr)
		    4'b0000 : wdt_h.pwdata <= wwdg_cr;
		    4'b0001 : wdt_h.pwdata <= wwdg_cfr;
	    endcase

        end	
//Down counting and wdt logic
always @(posedge wdt_h.pclk)

	if(wwdg_cr[7] == 1)
		 begin
	   		if(wwdg_cr[6:0] > wwdg_cfr[6:0])
		           wwdg_cr = wwdg_cr-1;
	   	        else
		           wdt_intr<= 1;
        	 end
endmodule

