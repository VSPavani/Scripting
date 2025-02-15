
module top_moore(
input clk,reset,d_in,
output detected,
output slowed_clk
    );
   parameter [2:0]S0 = 3'b000;  
   parameter [2:0]S1 = 3'b001;
   parameter [2:0]S10 = 3'b010;
   parameter [2:0]S100 = 3'b011;
   parameter [2:0]S1000 = 3'b100;
   parameter [2:0]S10001 = 3'b101;
   
   reg[2:0]cnt,nxt;
  
   clk_div div(clk,slowed_clk);
   
 
    
   always@(d_in or cnt)
   begin
     nxt = cnt;
     
     case(cnt)
        S0 : begin
             if (d_in == 1'b1)
                nxt = S1;
              else nxt = S0;  
             end
        S1 : begin
             if (d_in == 1'b0)
                nxt = S10;
              else nxt = S1;  
             end
         S10 : begin
             if (d_in == 1'b0)
                nxt = S100;
              else nxt = S1;  
             end
         S100 : begin
             if (d_in == 1'b0)
                nxt = S1000;
             else nxt = S1;   
             end
        S1000 : begin
             if (d_in == 1'b1)
                begin 
                nxt = S10001;  
                end
              else nxt = S0;   
             end
        S10001 : begin
                 if (d_in == 1'b0)
                    nxt = S10;
                 else nxt = S0;     
                 end    
     default nxt = S0;                                    
     endcase
       
   end 
   
    always@(posedge slowed_clk) 
   begin
     if(reset) 
        cnt <= S0;
     else 
        cnt <= nxt;
    end 
    
  assign detected = (cnt==S10001); 
                
endmodule



module clk_div(clk, slowed_clk);
    input clk;
    output reg slowed_clk;
    parameter mid = 27'd67108864;
    reg [26:0]counter;
    
    always@(posedge clk)
    begin
        counter <= counter + 1; 
        if(counter<mid) begin
            slowed_clk <= 0;
        end
        else begin
            slowed_clk <= 1;
        end
    end
    
endmodule
