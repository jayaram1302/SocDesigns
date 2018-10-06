//PWM with upcounter Timer

`include "interface.sv"

module pwm (apb_if pwm_t, output reg pwm_out);

reg [15:0] tim_cnt;
reg ;15:0] local_cnt;
reg [15:0] tim_cmpr;

//The clock from APB will be divided and given to Timer,
//Here directly pclk is considered as divded/1 clock to the Timer
always @(posedge pwm_t.pclk or pwm_t.presetn)
        if(presetn == 1'b0)
        begin
        pwm_out <= 1'b1;
        tim_cnt <= 'h0000;
        tim_cmpr<= 'h0000;
        local_cnt <= 'h0000;
        end

        else if(pwm_t.penable == 1'b1 && pwm_t.psel==1'b1 && pwm_t.pwrite==1'b1)
        begin
            case (pwm_t.paddr)
                    4'b0000 : tim_cnt <= pwm_t.pwdata;
                    4'b0001 : tim_cmpr <= pwm_t.pwdata;
            endcase

        end


        always @(posedge pwm_t.pclk)
        if(pwm_t.penable == 1'b1 && pwm_t.psel==1'b1 && pwm_t.pwrite==1'b0)
        begin
            case (pwm_t.paddr)
                    4'b0000 : pwm_t.pwdata <= tim_cnt;
                    4'b0001 : pwm_t.pwdata <= tim_cmpr;
            endcase
        end

        //pwm logic
        always@(posedge pwm_t.pclk)
                if(local_cnt<tim_cmpr)
                begin
                        pwm_out <= 1;
                        tim_cnt++;
                end
                else
                begin
                        if(local_cnt == tim_cnt)
                                local_cnt <= 'h0000;
                        pwm_out <= 0;
                end
endmodule
