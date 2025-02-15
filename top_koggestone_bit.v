
module top_koggestone_bit(
        input [31:0] A,
		input [31:0] B,
		input Cin,
		output [31:0] S,
		output Cout
    );
  
wire [31:0] stage0G;
wire [31:0] stage0P;
wire [31:0] stage1G;
wire [31:0] stage1P;
wire [31:0] stage2G;
wire [31:0] stage2P;
wire [31:0] stage3G;
wire [31:0] stage3P;
wire [31:0] stage4G;
wire [31:0] stage4P;
wire [31:0] stage5G;
wire [31:0] stage5P;
  
  
// stage 0 
genvar i;
assign stage0G[0] = Cin;    
generate
	for(i=1;i<32;i=i+1) begin
		BitwiseG G(A[i], B[i], stage0G[i]);
	end
	
	for(i=0;i<32;i=i+1) begin
		BitwiseP P(A[i], B[i], stage0P[i]);
	end
endgenerate
//////////////////////////// 
 
// stage 1  

BUFFER Buffer10(stage0P[0],stage0G[0],stage1P[0],stage1G[0]);

GrayCell GC10(stage0G[1],stage0P[1],stage0G[0],stage1G[1]);

BlackCell BC10(stage0G[2],stage0P[2],stage0G[1],stage0P[1],stage1G[2],stage1P[2]);
BlackCell BC11(stage0G[3],stage0P[3],stage0G[2],stage0P[2],stage1G[3],stage1P[3]);
BlackCell BC12(stage0G[4],stage0P[4],stage0G[3],stage0P[3],stage1G[4],stage1P[4]);
BlackCell BC13(stage0G[5],stage0P[5],stage0G[4],stage0P[4],stage1G[5],stage1P[5]);
BlackCell BC14(stage0G[6],stage0P[6],stage0G[5],stage0P[5],stage1G[6],stage1P[6]);

BlackCell BC15(stage0G[7],stage0P[7],stage0G[6],stage0P[6],stage1G[7],stage1P[7]);
BlackCell BC16(stage0G[8],stage0P[8],stage0G[7],stage0P[7],stage1G[8],stage1P[8]);
BlackCell BC17(stage0G[9],stage0P[9],stage0G[8],stage0P[8],stage1G[9],stage1P[9]);
BlackCell BC18(stage0G[10],stage0P[10],stage0G[9],stage0P[9],stage1G[10],stage1P[10]);
BlackCell BC19(stage0G[11],stage0P[11],stage0G[10],stage0P[10],stage1G[11],stage1P[11]);

BlackCell BC110(stage0G[12],stage0P[12],stage0G[11],stage0P[11],stage1G[12],stage1P[12]);
BlackCell BC111(stage0G[13],stage0P[13],stage0G[12],stage0P[12],stage1G[13],stage1P[13]);
BlackCell BC112(stage0G[14],stage0P[14],stage0G[13],stage0P[13],stage1G[14],stage1P[14]);
BlackCell BC113(stage0G[15],stage0P[15],stage0G[14],stage0P[14],stage1G[15],stage1P[15]);
BlackCell BC114(stage0G[16],stage0P[16],stage0G[15],stage0P[15],stage1G[16],stage1P[16]);

BlackCell BC115(stage0G[17],stage0P[17],stage0G[16],stage0P[16],stage1G[17],stage1P[17]);
BlackCell BC116(stage0G[18],stage0P[18],stage0G[17],stage0P[17],stage1G[18],stage1P[18]);
BlackCell BC117(stage0G[19],stage0P[19],stage0G[18],stage0P[18],stage1G[19],stage1P[19]);
BlackCell BC118(stage0G[20],stage0P[20],stage0G[19],stage0P[19],stage1G[20],stage1P[20]);
BlackCell BC119(stage0G[21],stage0P[21],stage0G[20],stage0P[20],stage1G[21],stage1P[21]);

BlackCell BC120(stage0G[22],stage0P[22],stage0G[21],stage0P[21],stage1G[22],stage1P[22]);
BlackCell BC121(stage0G[23],stage0P[23],stage0G[22],stage0P[22],stage1G[23],stage1P[23]);
BlackCell BC122(stage0G[24],stage0P[24],stage0G[23],stage0P[23],stage1G[24],stage1P[24]);
BlackCell BC123(stage0G[25],stage0P[25],stage0G[24],stage0P[24],stage1G[25],stage1P[25]);
BlackCell BC124(stage0G[26],stage0P[26],stage0G[25],stage0P[25],stage1G[26],stage1P[26]);

BlackCell BC125(stage0G[27],stage0P[27],stage0G[26],stage0P[26],stage1G[27],stage1P[27]);
BlackCell BC126(stage0G[28],stage0P[28],stage0G[27],stage0P[27],stage1G[28],stage1P[28]);
BlackCell BC127(stage0G[29],stage0P[29],stage0G[28],stage0P[28],stage1G[29],stage1P[29]);
BlackCell BC128(stage0G[30],stage0P[30],stage0G[29],stage0P[29],stage1G[30],stage1P[30]);
BlackCell BC129(stage0G[31],stage0P[31],stage0G[30],stage0P[30],stage1G[31],stage1P[31]);


////////////////////////////  

// stage 2 

assign stage2P[0] = stage1P[0];
assign stage2G[0] = stage1G[0]; 

BUFFER Buff20(stage1P[1],stage1G[1],stage2P[1],stage2G[1]);

GrayCell GC20(stage1G[2],stage1P[2],stage1G[0],stage2G[2]);
GrayCell GC21(stage1G[3],stage1P[3],stage1G[1],stage2G[3]);

BlackCell BC20(stage1G[4],stage1P[4],stage1G[2],stage1P[2],stage2G[4],stage2P[4]);
BlackCell BC21(stage1G[5],stage1P[5],stage1G[3],stage1P[3],stage2G[5],stage2P[5]);
BlackCell BC22(stage1G[6],stage1P[6],stage1G[4],stage1P[4],stage2G[6],stage2P[6]);
BlackCell BC23(stage1G[7],stage1P[7],stage1G[5],stage1P[5],stage2G[7],stage2P[7]);
BlackCell BC24(stage1G[8],stage1P[8],stage1G[6],stage1P[6],stage2G[8],stage2P[8]);

BlackCell BC25(stage1G[9],stage1P[9],stage1G[7],stage1P[7],stage2G[9],stage2P[9]);
BlackCell BC26(stage1G[10],stage1P[10],stage1G[8],stage1P[8],stage2G[10],stage2P[10]);
BlackCell BC27(stage1G[11],stage1P[11],stage1G[9],stage1P[9],stage2G[11],stage2P[11]);
BlackCell BC28(stage1G[12],stage1P[12],stage1G[10],stage1P[10],stage2G[12],stage2P[12]);
BlackCell BC29(stage1G[13],stage1P[13],stage1G[11],stage1P[11],stage2G[13],stage2P[13]);

BlackCell BC210(stage1G[14],stage1P[14],stage1G[12],stage1P[12],stage2G[14],stage2P[14]);
BlackCell BC211(stage1G[15],stage1P[15],stage1G[13],stage1P[13],stage2G[15],stage2P[15]);
BlackCell BC212(stage1G[16],stage1P[16],stage1G[14],stage1P[14],stage2G[16],stage2P[16]);
BlackCell BC213(stage1G[17],stage1P[17],stage1G[15],stage1P[15],stage2G[17],stage2P[17]);
BlackCell BC214(stage1G[18],stage1P[18],stage1G[16],stage1P[16],stage2G[18],stage2P[18]);

BlackCell BC215(stage1G[19],stage1P[19],stage1G[17],stage1P[17],stage2G[19],stage2P[19]);
BlackCell BC216(stage1G[20],stage1P[20],stage1G[18],stage1P[18],stage2G[20],stage2P[20]);
BlackCell BC217(stage1G[21],stage1P[21],stage1G[19],stage1P[19],stage2G[21],stage2P[21]);
BlackCell BC218(stage1G[22],stage1P[22],stage1G[20],stage1P[20],stage2G[22],stage2P[22]);
BlackCell BC219(stage1G[23],stage1P[23],stage1G[21],stage1P[21],stage2G[23],stage2P[23]);

BlackCell BC220(stage1G[24],stage1P[24],stage1G[22],stage1P[22],stage2G[24],stage2P[24]);
BlackCell BC221(stage1G[25],stage1P[25],stage1G[23],stage1P[23],stage2G[25],stage2P[25]);
BlackCell BC222(stage1G[26],stage1P[26],stage1G[24],stage1P[24],stage2G[26],stage2P[26]);
BlackCell BC223(stage1G[27],stage1P[27],stage1G[25],stage1P[25],stage2G[27],stage2P[27]);
BlackCell BC224(stage1G[28],stage1P[28],stage1G[26],stage1P[26],stage2G[28],stage2P[28]);

BlackCell BC225(stage1G[29],stage1P[29],stage1G[27],stage1P[27],stage2G[29],stage2P[29]);
BlackCell BC226(stage1G[30],stage1P[30],stage1G[28],stage1P[28],stage2G[30],stage2P[30]);
BlackCell BC227(stage1G[31],stage1P[31],stage1G[29],stage1P[29],stage2G[31],stage2P[31]);


//////////////////////////// 

// stage 3

assign stage3P[0] = stage2P[0];
assign stage3G[0] = stage2G[0];
assign stage3P[1] = stage2P[1];
assign stage3G[1] = stage2G[1];  

BUFFER Buff30(stage2P[2],stage2G[2],stage3P[2],stage3G[2]);
BUFFER Buff31(stage2P[3],stage2G[3],stage3P[3],stage3G[3]);

GrayCell GC30(stage2G[4],stage2P[4],stage2G[0],stage3G[4]);
GrayCell GC31(stage2G[5],stage2P[5],stage2G[1],stage3G[5]);
GrayCell GC32(stage2G[6],stage2P[6],stage2G[2],stage3G[6]);
GrayCell GC33(stage2G[7],stage2P[7],stage2G[3],stage3G[7]);

BlackCell BC30(stage2G[8],stage2P[8],stage2G[4],stage2P[4],stage3G[8],stage3P[8]);
BlackCell BC31(stage2G[9],stage2P[9],stage2G[5],stage2P[5],stage3G[9],stage3P[9]);
BlackCell BC32(stage2G[10],stage2P[10],stage2G[6],stage2P[6],stage3G[10],stage3P[10]);
BlackCell BC33(stage2G[11],stage2P[11],stage2G[7],stage2P[7],stage3G[11],stage3P[11]);
BlackCell BC34(stage2G[12],stage2P[12],stage2G[8],stage2P[8],stage3G[12],stage3P[12]);

BlackCell BC35(stage2G[13],stage2P[13],stage2G[9],stage2P[9],stage3G[13],stage3P[13]);
BlackCell BC36(stage2G[14],stage2P[14],stage2G[10],stage2P[10],stage3G[14],stage3P[14]);
BlackCell BC37(stage2G[15],stage2P[15],stage2G[11],stage2P[11],stage3G[15],stage3P[15]);
BlackCell BC38(stage2G[16],stage2P[16],stage2G[12],stage2P[12],stage3G[16],stage3P[16]);
BlackCell BC39(stage2G[17],stage2P[17],stage2G[13],stage2P[13],stage3G[17],stage3P[17]);

BlackCell BC310(stage2G[18],stage2P[18],stage2G[14],stage2P[14],stage3G[18],stage3P[18]);
BlackCell BC311(stage2G[19],stage2P[19],stage2G[15],stage2P[15],stage3G[19],stage3P[19]);
BlackCell BC312(stage2G[20],stage2P[20],stage2G[16],stage2P[16],stage3G[20],stage3P[20]);
BlackCell BC313(stage2G[21],stage2P[21],stage2G[17],stage2P[17],stage3G[21],stage3P[21]);
BlackCell BC314(stage2G[22],stage2P[22],stage2G[18],stage2P[18],stage3G[22],stage3P[22]);

BlackCell BC315(stage2G[23],stage2P[23],stage2G[19],stage2P[19],stage3G[23],stage3P[23]);
BlackCell BC316(stage2G[24],stage2P[24],stage2G[20],stage2P[20],stage3G[24],stage3P[24]);
BlackCell BC317(stage2G[25],stage2P[25],stage2G[21],stage2P[21],stage3G[25],stage3P[25]);
BlackCell BC318(stage2G[26],stage2P[26],stage2G[22],stage2P[22],stage3G[26],stage3P[26]);
BlackCell BC319(stage2G[27],stage2P[27],stage2G[23],stage2P[23],stage3G[27],stage3P[27]);

BlackCell BC320(stage2G[28],stage2P[28],stage2G[24],stage2P[24],stage3G[28],stage3P[28]);
BlackCell BC321(stage2G[29],stage2P[29],stage2G[25],stage2P[25],stage3G[29],stage3P[29]);
BlackCell BC322(stage2G[30],stage2P[30],stage2G[26],stage2P[26],stage3G[30],stage3P[30]);
BlackCell BC323(stage2G[31],stage2P[31],stage2G[27],stage2P[27],stage3G[31],stage3P[31]);


//////////////////////////// 

// stage 4  

assign stage4P[0] = stage3P[0];
assign stage4G[0] = stage3G[0];
assign stage4P[1] = stage3P[1];
assign stage4G[1] = stage3G[1]; 
assign stage4P[2] = stage3P[2];
assign stage4G[2] = stage3G[2];
assign stage4P[3] = stage3P[3];
assign stage4G[3] = stage3G[3]; 

BUFFER Buff40(stage3P[4],stage3G[4],stage4P[4],stage4G[4]);
BUFFER Buff41(stage3P[5],stage3G[5],stage4P[5],stage4G[5]);
BUFFER Buff42(stage3P[6],stage3G[6],stage4P[6],stage4G[6]);
BUFFER Buff43(stage3P[7],stage3G[7],stage4P[7],stage4G[7]);

GrayCell GC40(stage3G[8],stage3P[8],stage3G[0],stage4G[8]);
GrayCell GC41(stage3G[9],stage3P[9],stage3G[1],stage4G[9]);
GrayCell GC42(stage3G[10],stage3P[10],stage3G[2],stage4G[10]);
GrayCell GC43(stage3G[11],stage3P[11],stage3G[3],stage4G[11]);

GrayCell GC44(stage3G[12],stage3P[12],stage3G[4],stage4G[12]);
GrayCell GC45(stage3G[13],stage3P[13],stage3G[5],stage4G[13]);
GrayCell GC46(stage3G[14],stage3P[14],stage3G[6],stage4G[14]);
GrayCell GC47(stage3G[15],stage3P[15],stage3G[7],stage4G[15]);


BlackCell BC40(stage3G[16],stage3P[16],stage3G[8],stage3P[8],stage4G[16],stage4P[16]);
BlackCell BC41(stage3G[17],stage3P[17],stage3G[9],stage3P[9],stage4G[17],stage4P[17]);
BlackCell BC42(stage3G[18],stage3P[18],stage3G[10],stage3P[10],stage4G[18],stage4P[18]);
BlackCell BC43(stage3G[19],stage3P[19],stage3G[11],stage3P[11],stage4G[19],stage4P[19]);
BlackCell BC44(stage3G[20],stage3P[20],stage3G[12],stage3P[12],stage4G[20],stage4P[20]);

BlackCell BC45(stage3G[21],stage3P[21],stage3G[13],stage3P[13],stage4G[21],stage4P[21]);
BlackCell BC46(stage3G[22],stage3P[22],stage3G[14],stage3P[14],stage4G[22],stage4P[22]);
BlackCell BC347(stage3G[23],stage3P[23],stage3G[15],stage3P[15],stage4G[23],stage4P[23]);
BlackCell BC348(stage3G[24],stage3P[24],stage3G[16],stage3P[16],stage4G[24],stage4P[24]);
BlackCell BC349(stage3G[25],stage3P[25],stage3G[17],stage3P[17],stage4G[25],stage4P[25]);

BlackCell BC3410(stage3G[26],stage3P[26],stage3G[18],stage3P[18],stage4G[26],stage4P[26]);
BlackCell BC411(stage3G[27],stage3P[27],stage3G[19],stage3P[19],stage4G[27],stage4P[27]);
BlackCell BC412(stage3G[28],stage3P[28],stage3G[20],stage3P[20],stage4G[28],stage4P[28]);
BlackCell BC413(stage3G[29],stage3P[29],stage3G[21],stage3P[21],stage4G[29],stage4P[29]);
BlackCell BC414(stage3G[30],stage3P[30],stage3G[22],stage3P[22],stage4G[30],stage4P[30]);

BlackCell BC415(stage3G[31],stage3P[31],stage3G[23],stage3P[23],stage4G[31],stage4P[31]);




//////////////////////////// 

// stage 5  

assign stage5P[0] = stage4P[0];
assign stage5G[0] = stage4G[0];
assign stage5P[1] = stage4P[1];
assign stage5G[1] = stage4G[1]; 
assign stage5P[2] = stage4P[2];
assign stage5G[2] = stage4G[2];
assign stage5P[3] = stage4P[3];
assign stage5G[3] = stage4G[3]; 
assign stage5P[4] = stage4P[4];
assign stage5G[4] = stage4G[4];
assign stage5P[5] = stage4P[5];
assign stage5G[5] = stage4G[5]; 
assign stage5P[6] = stage4P[6];
assign stage5G[6] = stage4G[6];
assign stage5P[7] = stage4P[7];
assign stage5G[7] = stage4G[7]; 

BUFFER Buff50(stage4P[8],stage4G[8],stage5P[8],stage5G[8]);
BUFFER Buff51(stage4P[9],stage4G[9],stage5P[9],stage5G[9]);
BUFFER Buff52(stage4P[10],stage4G[10],stage5P[10],stage5G[10]);
BUFFER Buff53(stage4P[11],stage4G[11],stage5P[11],stage5G[11]);
BUFFER Buff54(stage4P[12],stage4G[12],stage5P[12],stage5G[12]);
BUFFER Buff55(stage4P[13],stage4G[13],stage5P[13],stage5G[13]);
BUFFER Buff56(stage4P[14],stage4G[14],stage5P[14],stage5G[14]);
BUFFER Buff57(stage4P[15],stage4G[15],stage5P[15],stage5G[15]);

GrayCell GC50(stage4G[16],stage4P[16],stage4G[0],stage5G[16]);
GrayCell GC51(stage4G[17],stage4P[17],stage4G[1],stage5G[17]);
GrayCell GC52(stage4G[18],stage4P[18],stage4G[2],stage5G[18]);
GrayCell GC53(stage4G[19],stage4P[19],stage4G[3],stage5G[19]);

GrayCell GC54(stage4G[20],stage4P[20],stage4G[4],stage5G[20]);
GrayCell GC55(stage4G[21],stage4P[21],stage4G[5],stage5G[21]);
GrayCell GC56(stage4G[22],stage4P[22],stage4G[6],stage5G[22]);
GrayCell GC57(stage4G[23],stage4P[23],stage4G[7],stage5G[23]);

GrayCell GC58(stage4G[24],stage4P[24],stage4G[8],stage5G[24]);
GrayCell GC59(stage4G[25],stage4P[25],stage4G[9],stage5G[25]);
GrayCell GC510(stage4G[26],stage4P[26],stage4G[10],stage5G[26]);
GrayCell GC511(stage4G[27],stage4P[27],stage4G[11],stage5G[27]);

GrayCell GC512(stage4G[28],stage4P[28],stage4G[12],stage5G[28]);
GrayCell GC513(stage4G[29],stage4P[29],stage4G[13],stage5G[29]);
GrayCell GC514(stage4G[30],stage4P[30],stage4G[14],stage5G[30]);
GrayCell GC515(stage4G[31],stage4P[31],stage4G[15],stage5G[31]);

//////////////////////////// 


// TOTAL SUM

SumGen S0(stage0P[0],Cin,S[0]);
SumGen S1(stage0P[1],stage5G[0],S[1]);
SumGen S2(stage0P[2],stage5G[1],S[2]);
SumGen S3(stage0P[3],stage5G[2],S[3]);
SumGen S4(stage0P[4],stage5G[3],S[4]);

SumGen S5(stage0P[5],stage5G[4],S[5]);
SumGen S6(stage0P[6],stage5G[5],S[6]);
SumGen S7(stage0P[7],stage5G[6],S[7]);
SumGen S8(stage0P[8],stage5G[7],S[8]);

SumGen S9(stage0P[9],stage5G[8],S[9]);
SumGen S10(stage0P[10],stage5G[9],S[10]);
SumGen S11(stage0P[11],stage5G[10],S[11]);
SumGen S12(stage0P[12],stage5G[11],S[12]);

SumGen S13(stage0P[13],stage5G[12],S[13]);
SumGen S14(stage0P[14],stage5G[13],S[14]);
SumGen S15(stage0P[15],stage5G[14],S[15]);
SumGen S16(stage0P[16],stage5G[15],S[16]);

SumGen S17(stage0P[17],stage5G[16],S[17]);
SumGen S18(stage0P[18],stage5G[17],S[18]);
SumGen S19(stage0P[19],stage5G[18],S[19]);
SumGen S20(stage0P[20],stage5G[19],S[20]);

SumGen S21(stage0P[21],stage5G[20],S[21]);
SumGen S22(stage0P[22],stage5G[21],S[22]);
SumGen S23(stage0P[23],stage5G[22],S[23]);
SumGen S24(stage0P[24],stage5G[23],S[24]);

SumGen S25(stage0P[25],stage5G[24],S[25]);
SumGen S26(stage0P[26],stage5G[25],S[26]);
SumGen S27(stage0P[27],stage5G[26],S[27]);
SumGen S28(stage0P[28],stage5G[27],S[28]);

SumGen S29(stage0P[29],stage5G[28],S[29]);
SumGen S30(stage0P[30],stage5G[29],S[30]);
SumGen S31(stage0P[31],stage5G[30],S[31]);
assign Cout=stage5G[31];




///////////////////////////

       
endmodule




module BitwiseG(
	input Ai,
	input Bi,
	output Gi
    );

and (Gi,Ai,Bi);

endmodule


module BitwiseP(
		input Ai,
		input Bi,
		output Pi
    );

xor  (Pi,Ai,Bi);

endmodule

module BUFFER(
	input Pi,
	input Gi,
	output Po,
	output Go
    );
	 
assign Po = Pi;
assign Go = Gi;

endmodule


module BlackCell(
	input Gik,
	input Pik,
	input Gk_1j,
	input Pk_1j,
	output Gij,
	output Pij
    );
	 
wire net1;

and (net1,Pik,Gk_1j);
or  (Gij,Gik,net1);		
and(Pij,Pik,Pk_1j);		

endmodule

module GrayCell(
	input Gik,
	input Pik,
	input Gk_1j,
	output Gij
    );

wire net1;

and (net1,Pik,Gk_1j);
or (Gij,Gik,net1);		

endmodule


module SumGen(
		input ci_1,
		input Pii,
		output Sum
    );

xor  (Sum,ci_1,Pii);

endmodule
