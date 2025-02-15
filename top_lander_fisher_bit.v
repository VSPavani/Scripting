
module top_lander_fisher_bit(
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
wire [31:0] stage6G;
wire [31:0] stage6P;
  
  
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

BUFFER Buffer11(stage0P[2],stage0G[2],stage1P[2],stage1G[2]);
BlackCell BC10(stage0G[3],stage0P[3],stage0G[2],stage0P[2],stage1G[3],stage1P[3]);

BUFFER Buffer12(stage0P[4],stage0G[4],stage1P[4],stage1G[4]);
BlackCell BC11(stage0G[5],stage0P[5],stage0G[4],stage0P[4],stage1G[5],stage1P[5]);

BUFFER Buffer13(stage0P[6],stage0G[6],stage1P[6],stage1G[6]);
BlackCell BC12(stage0G[7],stage0P[7],stage0G[6],stage0P[6],stage1G[7],stage1P[7]);

BUFFER Buffer14(stage0P[8],stage0G[8],stage1P[8],stage1G[8]);
BlackCell BC13(stage0G[9],stage0P[9],stage0G[8],stage0P[8],stage1G[9],stage1P[9]);

BUFFER Buffer15(stage0P[10],stage0G[10],stage1P[10],stage1G[10]);
BlackCell BC14(stage0G[11],stage0P[11],stage0G[10],stage0P[10],stage1G[11],stage1P[11]);

BUFFER Buffer16(stage0P[12],stage0G[12],stage1P[12],stage1G[12]);
BlackCell BC15(stage0G[13],stage0P[13],stage0G[12],stage0P[12],stage1G[13],stage1P[13]);

BUFFER Buffer17(stage0P[14],stage0G[14],stage1P[14],stage1G[14]);
BlackCell BC16(stage0G[15],stage0P[15],stage0G[14],stage0P[14],stage1G[15],stage1P[15]);

BUFFER Buffer18(stage0P[16],stage0G[16],stage1P[16],stage1G[16]);
BlackCell BC17(stage0G[17],stage0P[17],stage0G[16],stage0P[16],stage1G[17],stage1P[17]);

BUFFER Buffer19(stage0P[18],stage0G[18],stage1P[18],stage1G[18]);
BlackCell BC18(stage0G[19],stage0P[19],stage0G[18],stage0P[18],stage1G[19],stage1P[19]);

BUFFER Buffer110(stage0P[20],stage0G[20],stage1P[20],stage1G[20]);
BlackCell BC19(stage0G[21],stage0P[21],stage0G[20],stage0P[20],stage1G[21],stage1P[21]);

BUFFER Buffer111(stage0P[22],stage0G[22],stage1P[22],stage1G[22]);
BlackCell BC110(stage0G[23],stage0P[23],stage0G[22],stage0P[22],stage1G[23],stage1P[23]);

BUFFER Buffer112(stage0P[24],stage0G[24],stage1P[24],stage1G[24]);
BlackCell BC111(stage0G[25],stage0P[25],stage0G[24],stage0P[24],stage1G[25],stage1P[25]);

BUFFER Buffer113(stage0P[26],stage0G[26],stage1P[26],stage1G[26]);
BlackCell BC112(stage0G[27],stage0P[27],stage0G[26],stage0P[26],stage1G[27],stage1P[27]);

BUFFER Buffer114(stage0P[28],stage0G[28],stage1P[28],stage1G[28]);
BlackCell BC113(stage0G[29],stage0P[29],stage0G[28],stage0P[28],stage1G[29],stage1P[29]);

BUFFER Buffer115(stage0P[30],stage0G[30],stage1P[30],stage1G[30]);
BlackCell BC114(stage0G[31],stage0P[31],stage0G[30],stage0P[30],stage1G[31],stage1P[31]);

////////////////////////////  

// stage 2 

assign stage2P[0] = stage1P[0];
assign stage2G[0] = stage1G[0]; 

BUFFER Buff20(stage1P[1],stage1G[1],stage2P[1],stage2G[1]);

assign stage2P[2] = stage1P[2];
assign stage2G[2] = stage1G[2];

GrayCell GC20(stage1G[3],stage1P[3],stage1G[1],stage2G[3]);
 
assign stage2P[4] = stage1P[4];
assign stage2G[4] = stage1G[4]; 

BUFFER Buff21(stage1P[5],stage1G[5],stage2P[5],stage2G[5]);

assign stage2P[6] = stage1P[6];
assign stage2G[6] = stage1G[6];

BlackCell BC20(stage1G[7],stage1P[7],stage1G[5],stage1P[5],stage2G[7],stage2P[7]); 

assign stage2P[8] = stage1P[8];
assign stage2G[8] = stage1G[8]; 

BUFFER Buff22(stage1P[9],stage1G[9],stage2P[9],stage2G[9]);

assign stage2P[10] = stage1P[10];
assign stage2G[10] = stage1G[10]; 

BlackCell BC21(stage1G[11],stage1P[11],stage1G[9],stage1P[9],stage2G[11],stage2P[11]);

assign stage2P[12] = stage1P[12];
assign stage2G[12] = stage1G[12]; 

BUFFER Buff23(stage1P[13],stage1G[13],stage2P[13],stage2G[13]);

assign stage2P[14] = stage1P[14];
assign stage2G[14] = stage1G[14]; 

BlackCell BC22(stage1G[15],stage1P[15],stage1G[13],stage1P[13],stage2G[15],stage2P[15]);

assign stage2P[16] = stage1P[16];
assign stage2G[16] = stage1G[16]; 

BUFFER Buff24(stage1P[17],stage1G[17],stage2P[17],stage2G[17]);

assign stage2P[18] = stage1P[18];
assign stage2G[18] = stage1G[18]; 

BlackCell BC23(stage1G[19],stage1P[19],stage1G[17],stage1P[17],stage2G[19],stage2P[19]);

assign stage2P[20] = stage1P[20];
assign stage2G[20] = stage1G[20];

BUFFER Buff25(stage1P[21],stage1G[21],stage2P[21],stage2G[21]);

assign stage2P[22] = stage1P[22];
assign stage2G[22] = stage1G[22];

BlackCell BC24(stage1G[23],stage1P[23],stage1G[21],stage1P[21],stage2G[23],stage2P[23]); 

assign stage2P[24] = stage1P[24];
assign stage2G[24] = stage1G[24]; 

BUFFER Buff26(stage1P[25],stage1G[25],stage2P[25],stage2G[25]);

assign stage2P[26] = stage1P[26];
assign stage2G[26] = stage1G[26]; 

BlackCell BC25(stage1G[27],stage1P[27],stage1G[25],stage1P[25],stage2G[27],stage2P[27]);

assign stage2P[28] = stage1P[28];
assign stage2G[28] = stage1G[28]; 

BUFFER Buff27(stage1P[29],stage1G[29],stage2P[29],stage2G[29]);

assign stage2P[30] = stage1P[30];
assign stage2G[30] = stage1G[30];  

BlackCell BC26(stage1G[31],stage1P[31],stage1G[29],stage1P[29],stage2G[31],stage2P[31]);

//////////////////////////// 

// stage 3

assign stage3P[0] = stage2P[0];
assign stage3G[0] = stage2G[0];

assign stage3P[1] = stage2P[1];
assign stage3G[1] = stage2G[1]; 

assign stage3P[2] = stage2P[2];
assign stage3G[2] = stage2G[2];  

BUFFER Buff30(stage2P[3],stage2G[3],stage3P[3],stage3G[3]);

assign stage3P[4] = stage2P[4];
assign stage3G[4] = stage2G[4];

GrayCell GC30(stage2G[5],stage2P[5],stage2G[3],stage3G[5]);

assign stage3P[6] = stage2P[6];
assign stage3G[6] = stage2G[6];

GrayCell GC31(stage2G[7],stage2P[7],stage2G[3],stage3G[7]);

assign stage3P[8] = stage2P[8];
assign stage3G[8] = stage2G[8];

assign stage3P[9] = stage2P[9];
assign stage3G[9] = stage2G[9]; 

assign stage3P[10] = stage2P[10];
assign stage3G[10] = stage2G[10];  

assign stage3P[11] = stage2P[11];
assign stage3G[11] = stage2G[11];

assign stage3P[12] = stage2P[12];
assign stage3G[12] = stage2G[12]; 

BlackCell BC30(stage2G[13],stage2P[13],stage2G[11],stage2P[11],stage3G[13],stage3P[13]);

assign stage3P[14] = stage2P[14];
assign stage3G[14] = stage2G[14]; 

BlackCell BC31(stage2G[15],stage2P[15],stage2G[11],stage2P[11],stage3G[15],stage3P[15]);

assign stage3P[16] = stage2P[16];
assign stage3G[16] = stage2G[16];  

assign stage3P[17] = stage2P[17];
assign stage3G[17] = stage2G[17];

assign stage3P[18] = stage2P[18];
assign stage3G[18] = stage2G[18]; 

BUFFER Buff31(stage2P[19],stage2G[19],stage3P[19],stage3G[19]);

assign stage3P[20] = stage2P[20];
assign stage3G[20] = stage2G[20]; 

BlackCell BC32(stage2G[21],stage2P[21],stage2G[19],stage2P[19],stage3G[21],stage3P[21]);

assign stage3P[22] = stage2P[22];
assign stage3G[22] = stage2G[22];

BlackCell BC33(stage2G[23],stage2P[23],stage2G[19],stage2P[19],stage3G[23],stage3P[23]);

assign stage3P[24] = stage2P[24];
assign stage3G[24] = stage2G[24];

assign stage3P[25] = stage2P[25];
assign stage3G[25] = stage2G[25]; 

assign stage3P[26] = stage2P[26];
assign stage3G[26] = stage2G[26];  

assign stage3P[27] = stage2P[27];
assign stage3G[27] = stage2G[27];

assign stage3P[28] = stage2P[28];
assign stage3G[28] = stage2G[28]; 

BlackCell BC34(stage2G[29],stage2P[29],stage2G[27],stage2P[27],stage3G[29],stage3P[29]);

assign stage3P[30] = stage2P[30];
assign stage3G[30] = stage2G[30];

BlackCell BC35(stage2G[31],stage2P[31],stage2G[27],stage2P[27],stage3G[31],stage3P[31]);

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

assign stage4P[4] = stage3P[4];
assign stage4G[4] = stage3G[4];

assign stage4P[5] = stage3P[5];
assign stage4G[5] = stage3G[5]; 

assign stage4P[6] = stage3P[6];
assign stage4G[6] = stage3G[6];

assign stage4P[7] = stage3P[7];
assign stage4G[7] = stage3G[7]; 

assign stage4P[8] = stage3P[8];
assign stage4G[8] = stage3G[8]; 

GrayCell GC40(stage3G[9],stage3P[9],stage3G[7],stage4G[9]);

assign stage4P[10] = stage3P[10];
assign stage4G[10] = stage3G[10]; 

GrayCell GC41(stage3G[11],stage3P[11],stage3G[7],stage4G[11]);

assign stage4P[12] = stage3P[12];
assign stage4G[12] = stage3G[12]; 

GrayCell GC42(stage3G[13],stage3P[13],stage3G[7],stage4G[13]);

assign stage4P[14] = stage3P[14];
assign stage4G[14] = stage3G[14]; 

GrayCell GC43(stage3G[15],stage3P[15],stage3G[7],stage4G[15]);

assign stage4P[16] = stage3P[16];
assign stage4G[16] = stage3G[16];

assign stage4P[17] = stage3P[17];
assign stage4G[17] = stage3G[17]; 

assign stage4P[18] = stage3P[18];
assign stage4G[18] = stage3G[18];

assign stage4P[19] = stage3P[19];
assign stage4G[19] = stage3G[19]; 

assign stage4P[20] = stage3P[20];
assign stage4G[20] = stage3G[20];

assign stage4P[21] = stage3P[21];
assign stage4G[21] = stage3G[21]; 

assign stage4P[22] = stage3P[22];
assign stage4G[22] = stage3G[22];

assign stage4P[23] = stage3P[23];
assign stage4G[23] = stage3G[23]; 

assign stage4P[24] = stage3P[24];
assign stage4G[24] = stage3G[24]; 

BlackCell BC40(stage3G[25],stage3P[25],stage3G[23],stage3P[23],stage4G[25],stage4P[25]);

assign stage4P[26] = stage3P[26];
assign stage4G[26] = stage3G[26]; 

BlackCell BC41(stage3G[27],stage3P[27],stage3G[23],stage3P[23],stage4G[27],stage4P[27]);

assign stage4P[28] = stage3P[28];
assign stage4G[28] = stage3G[28]; 

BlackCell BC42(stage3G[29],stage3P[29],stage3G[23],stage3P[23],stage4G[29],stage4P[29]);

assign stage4P[30] = stage3P[30];
assign stage4G[30] = stage3G[30]; 

BlackCell BC43(stage3G[31],stage3P[31],stage3G[23],stage3P[23],stage4G[31],stage4P[31]);


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

assign stage5P[8] = stage4P[8];
assign stage5G[8] = stage4G[8];

assign stage5P[9] = stage4P[9];
assign stage5G[9] = stage4G[9]; 

assign stage5P[10] = stage4P[10];
assign stage5G[10] = stage4G[10];

assign stage5P[11] = stage4P[11];
assign stage5G[11] = stage4G[11]; 

assign stage5P[12] = stage4P[12];
assign stage5G[12] = stage4G[12];

assign stage5P[13] = stage4P[13];
assign stage5G[13] = stage4G[13]; 

assign stage5P[14] = stage4P[14];
assign stage5G[14] = stage4G[14];

assign stage5P[15] = stage4P[15];
assign stage5G[15] = stage4G[15]; 

assign stage5P[16] = stage4P[16];
assign stage5G[16] = stage4G[16]; 

GrayCell GC50(stage4G[17],stage4P[17],stage4G[15],stage5G[17]);

assign stage5P[18] = stage4P[18];
assign stage5G[18] = stage4G[18];

GrayCell GC51(stage4G[19],stage4P[19],stage4G[15],stage5G[19]);

assign stage5P[20] = stage4P[20];
assign stage5G[20] = stage4G[20];

GrayCell GC52(stage4G[21],stage4P[21],stage4G[15],stage5G[21]);

assign stage5P[22] = stage4P[22];
assign stage5G[22] = stage4G[22];

GrayCell GC53(stage4G[23],stage4P[23],stage4G[15],stage5G[23]);

assign stage5P[24] = stage4P[24];
assign stage5G[24] = stage4G[24];

GrayCell GC54(stage4G[25],stage4P[25],stage4G[15],stage5G[25]);

assign stage5P[26] = stage4P[26];
assign stage5G[26] = stage4G[26];

GrayCell GC55(stage4G[27],stage4P[27],stage4G[15],stage5G[27]);

assign stage5P[28] = stage4P[28];
assign stage5G[28] = stage4G[28];

GrayCell GC56(stage4G[29],stage4P[29],stage4G[15],stage5G[29]);

assign stage5P[30] = stage4P[30];
assign stage5G[30] = stage4G[30];

GrayCell GC57(stage4G[31],stage4P[31],stage4G[15],stage5G[31]);

//////////////////////////// 
 

// stage 6

assign stage6P[0] = stage5P[0];
assign stage6G[0] = stage5G[0];

assign stage6P[1] = stage5P[1];
assign stage6G[1] = stage5G[1]; 

GrayCell GC60(stage5G[2],stage5P[2],stage5G[1],stage6G[2]);

assign stage6P[3] = stage5P[3];
assign stage6G[3] = stage5G[3];

GrayCell GC61(stage5G[4],stage5P[4],stage5G[3],stage6G[4]);

assign stage6P[5] = stage5P[5];
assign stage6G[5] = stage5G[5]; 

GrayCell GC62(stage5G[6],stage5P[6],stage5G[5],stage6G[6]);

assign stage6P[7] = stage5P[7];
assign stage6G[7] = stage5G[7];

GrayCell GC63(stage5G[8],stage5P[8],stage5G[7],stage6G[8]);

assign stage6P[9] = stage5P[9];
assign stage6G[9] = stage5G[9]; 

GrayCell GC64(stage5G[10],stage5P[10],stage5G[9],stage6G[10]);

assign stage6P[11] = stage5P[11];
assign stage6G[11] = stage5G[11];

GrayCell GC65(stage5G[12],stage5P[12],stage5G[11],stage6G[12]);

assign stage6P[13] = stage5P[13];
assign stage6G[13] = stage5G[13]; 

GrayCell GC66(stage5G[14],stage5P[14],stage5G[13],stage6G[14]);

assign stage6P[15] = stage5P[15];
assign stage6G[15] = stage5G[15];

GrayCell GC67(stage5G[16],stage5P[16],stage5G[15],stage6G[16]);

assign stage6P[17] = stage5P[17];
assign stage6G[17] = stage5G[17]; 

GrayCell GC68(stage5G[18],stage5P[18],stage5G[17],stage6G[18]);

assign stage6P[19] = stage5P[19];
assign stage6G[19] = stage5G[19];

GrayCell GC69(stage5G[20],stage5P[20],stage5G[19],stage6G[20]);

assign stage6P[21] = stage5P[21];
assign stage6G[21] = stage5G[21]; 

GrayCell GC610(stage5G[22],stage5P[22],stage5G[21],stage6G[22]);

assign stage6P[23] = stage5P[23];
assign stage6G[23] = stage5G[23];

GrayCell GC611(stage5G[24],stage5P[24],stage5G[23],stage6G[24]);

assign stage6P[25] = stage5P[25];
assign stage6G[25] = stage5G[25]; 

GrayCell GC612(stage5G[26],stage5P[26],stage5G[25],stage6G[26]);

assign stage6P[27] = stage5P[27];
assign stage6G[27] = stage5G[27];

GrayCell GC613(stage5G[28],stage5P[28],stage5G[27],stage6G[28]);

assign stage6P[29] = stage5P[29];
assign stage6G[29] = stage5G[29]; 

GrayCell GC614(stage5G[30],stage5P[30],stage5G[29],stage6G[30]);

assign stage6P[31] = stage5P[31];
assign stage6G[31] = stage5G[31]; 

//////////////////////////// 


// TOTAL SUM

SumGen S0(stage0P[0],Cin,S[0]);
SumGen S1(stage0P[1],stage6G[0],S[1]);
SumGen S2(stage0P[2],stage6G[1],S[2]);
SumGen S3(stage0P[3],stage6G[2],S[3]);
SumGen S4(stage0P[4],stage6G[3],S[4]);

SumGen S5(stage0P[5],stage6G[4],S[5]);
SumGen S6(stage0P[6],stage6G[5],S[6]);
SumGen S7(stage0P[7],stage6G[6],S[7]);
SumGen S8(stage0P[8],stage6G[7],S[8]);

SumGen S9(stage0P[9],stage6G[8],S[9]);
SumGen S10(stage0P[10],stage6G[9],S[10]);
SumGen S11(stage0P[11],stage6G[10],S[11]);
SumGen S12(stage0P[12],stage6G[11],S[12]);

SumGen S13(stage0P[13],stage6G[12],S[13]);
SumGen S14(stage0P[14],stage6G[13],S[14]);
SumGen S15(stage0P[15],stage6G[14],S[15]);
SumGen S16(stage0P[16],stage6G[15],S[16]);

SumGen S17(stage0P[17],stage6G[16],S[17]);
SumGen S18(stage0P[18],stage6G[17],S[18]);
SumGen S19(stage0P[19],stage6G[18],S[19]);
SumGen S20(stage0P[20],stage6G[19],S[20]);

SumGen S21(stage0P[21],stage6G[20],S[21]);
SumGen S22(stage0P[22],stage6G[21],S[22]);
SumGen S23(stage0P[23],stage6G[22],S[23]);
SumGen S24(stage0P[24],stage6G[23],S[24]);

SumGen S25(stage0P[25],stage6G[24],S[25]);
SumGen S26(stage0P[26],stage6G[25],S[26]);
SumGen S27(stage0P[27],stage6G[26],S[27]);
SumGen S28(stage0P[28],stage6G[27],S[28]);

SumGen S29(stage0P[29],stage6G[28],S[29]);
SumGen S30(stage0P[30],stage6G[29],S[30]);
SumGen S31(stage0P[31],stage6G[30],S[31]);
assign Cout=stage6G[31];




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
