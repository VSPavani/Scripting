
module top_mealy(
input clk,reset,d_in,
output detected,
output slowed_clk
    );
   parameter [2:0]S0 = 3'b000;  
   parameter [2:0]A0 = 3'b001;
   parameter [2:0]A01 = 3'b010;
   parameter [2:0]A010 = 3'b011;
   parameter [2:0]B1 = 3'b100;
   parameter [2:0]B10 = 3'b101;
   parameter [2:0]B101 = 3'b110;
   
   reg[2:0]cnt,nxt;
   reg z;
   
   clk_div div(clk,slowed_clk);
     
    always@(d_in or cnt)
   begin
     nxt = cnt;
     z = 0;
     
     case(cnt)
        S0 :
             if (d_in == 1'b0)
                 begin
                    nxt = A0;
                    z = 0;
                 end
              else begin
                  nxt = B1;
                  z = 0;
              end  
            
        A0 : 
             if (d_in == 1'b0) begin
                    nxt = A0;
                    z = 0;
                    end
              else begin nxt = A01;
              z = 0;
              end  
            
        A01 : 
             if (d_in == 1'b0) begin
                    nxt = A010;
                    z =0;
                    end
              else begin nxt = B1;  
              z = 0;
              end
           
         B1 : 
             if (d_in == 1'b0) begin
                    nxt = B10;
                    z=0;
                    end
             else begin nxt = B1; 
             z = 0;
             end  
             
        B10 : 
             if (d_in == 1'b0)
                    begin
                        nxt = A0;
                        z =0;
                    end  
              else begin 
              nxt = B101;  
              z =0;
              end 
            
        B101 : 
                 if (d_in == 1'b0)begin
                        nxt = A010;
                        z = 1;
                        end
                 else begin 
                 nxt = B1;
                 z = 0;
                 end     
                  
        A010 : 
                 if (d_in == 1'b0) begin
                        nxt = A0;
                        z = 0;
                        end
                 else begin
                 nxt = B101;
                 z = 1;
                 end     
                        
     default nxt = S0;                                    
     endcase
   end
   
 assign detected = z;  
 
   always@(posedge slowed_clk) 
   begin
     if(reset) 
        cnt <= S0;
     else 
        cnt <= nxt;
    end 
     
    
    
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


