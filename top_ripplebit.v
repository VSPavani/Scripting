
module top_ripplebit(a,b,c,d,sum);
input [3:0]a,b,c,d;
reg Cin;
wire [2:0]C1,C2;
wire [4:0]CC; 
wire[4:0]sum1,sum2;
output [5:0]sum;

always@(*)
begin
Cin=0;
end
Single S1(a[0],b[0],Cin,sum1[0],C1[0]);
Single S2(a[1],b[1],C1[0],sum1[1],C1[1]);
Single S3(a[2],b[2],C1[1],sum1[2],C1[2]);
Single S4(a[3],b[3],C1[2],sum1[3],sum1[4]);

endmodule

module Single(A,B,cin,s,cout);
input A,B,cin;
output s,cout;

assign cin=1'b0;
assign s=A^B^cin;
assign cout=(A&B)|(B&cin)|(cin&A);


endmodule
