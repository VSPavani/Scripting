module top_counter(count,clk,rst);
        output reg [3:0]count;
    
        input clk, rst;
    

        always @(posedge clk)
        begin
                if (rst)
                        count <= 0;
                else
                        count <= count+1;
        end
endmodule
