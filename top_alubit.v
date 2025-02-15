module top_alubit (
  input [2:0] operation,
  input [7:0] operand_A,
  input [7:0] operand_B,
  output reg [15:0] result = 16'b0,
  output reg carry_flag = 1'b0,
  output reg zero_flag = 1'b0
);

parameter [2:0] ADD = 3'b000,
               SUB = 3'b001,
               MUL = 3'b010,
               AND = 3'b011,
               OR  = 3'b100,
               NAND = 3'b101,
               NOR  = 3'b110,
               XOR  = 3'b111;

always @ (operation or operand_A or operand_B)
begin
  case (operation)
    ADD: begin
      result = operand_A + operand_B;
      carry_flag = result[8];
      zero_flag = (result == 16'b0);
    end

    SUB: begin
      result = operand_A - operand_B;
      carry_flag = result[8];
      zero_flag = (result == 16'b0);
    end

    MUL: begin
      result = operand_A * operand_B;
      zero_flag = (result == 16'b0);
    end

    AND: begin
      result = operand_A & operand_B;
      zero_flag = (result == 16'b0);
    end

    OR: begin
      result = operand_A | operand_B;
      zero_flag = (result == 16'b0);
    end

    NAND: begin
      result = ~(operand_A & operand_B);
      zero_flag = (result == 16'b0);
    end

    NOR: begin
      result = ~(operand_A | operand_B);
      zero_flag = (result == 16'b0);
    end

    XOR: begin
      result = operand_A ^ operand_B;
      zero_flag = (result == 16'b0);
    end

    default: begin
      result = 16'b0;
      carry_flag = 1'b0;
      zero_flag = 1'b0;
    end
  endcase
end

endmodule
