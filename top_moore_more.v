`timescale 1ns / 1ps
module clock_divider(
input main_clk, 
output slow_clk
    );
reg [31:0] counter;
    
always@ (posedge main_clk)
    begin
        counter <= counter + 1;
    end
assign slow_clk = counter[27];  
endmodule

module moore(clk, rst, w, z,slow_clk);
input clk, rst, w; // w is the input
output z; // z is the output
output slow_clk;
reg [2:0] y, Y; // Y is the next state variable, y is the present state variable
parameter [2:0] A = 3'b000, B = 3'b001,C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

wire slow_clk;
clock_divider inst(clk, slow_clk);

// Define the next state combinational circuit
always @(w or y)
    case (y)
    A:  if (w) Y = B;
        else Y = A;
    B:  if (w) Y = B;
        else Y = C;
    C:  if (w) Y = B;
        else Y = D;
    D:  if (w) Y = E;
        else Y = A;
    E:  if (w) Y = F;
        else Y = C;
    F:  if (w) Y = B;
        else Y = C;
    default: Y = A;
    endcase

always @(negedge rst or posedge slow_clk)

    if (rst == 0) y <= A;
    else y <= Y;

// Define output
assign z = (y == F);
endmodule

