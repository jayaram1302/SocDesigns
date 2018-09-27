interface apb_if;
   logic pclk;
   logic presetn;
   logic psel;
   logic pwrite;
   logic penable;
   logic pready;
   logic [31:0]paddr;
   logic [31:0]pwdata;
   logic [31:0]prdata;
   logic pslverr;
endinterface   

