LIBRARY ieee;
use ieee.std_logic_1164.all;

-- Controller
ENTITY controller IS
	PORT( op_code : IN std_logic_vector(3 DOWNTO 0);
		clk_in : IN STD_LOGIC;
		Beq: OUT BIT; -- should be 0 if not active
		Bne: OUT BIT; -- should be 1 if not active
		RegDest : OUT BIT; -- 0 on jumps, bne, beq, 1 for everything else.
		MemRead : OUT BIT;
		MemWrite : OUT BIT; -- only 1 when sw
		MemtoReg : OUT BIT;
		ALUOp : OUT std_logic_vector(2 DOWNTO 0);
		ALUSrc : OUT BIT; -- 0 takes from controller, 1 takes from immediate.
		RegWrite : OUT BIT;
		JumpDest : OUT BIT; -- 0 is register, 1 is from immediate. 1 is from beq/bne and j, 0 is for jr
		LessThan : OUT BIT; -- 0 normally, 1 when use the less than bit, only used for slt.
		ALUArg : OUT BIT -- 1 when we want to use immediate value. 
	);
END controller;

ARCHITECTURE dataflow OF controller IS
BEGIN
	update: PROCESS (clk_in) is
	BEGIN
		IF RISING_EDGE(clk_in) THEN
			case op_code is
				-- Math R types.
				when "0000" => Beq <= '0'; Bne <= '1'; RegDest <= '1'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "000"; RegWrite <= '1'; ALUSrc <= '1'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '0'; ALUArg <= '1';
				-- addiu
				when "0001" => Beq <= '0'; Bne <= '1'; RegDest <= '1'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "101"; RegWrite <= '1'; ALUSrc <= '0'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '0'; ALUArg <= '0';
				-- addi
				when "0011" => Beq <= '0'; Bne <= '1'; RegDest <= '1'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "101"; RegWrite <= '1'; ALUSrc <= '0'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '0'; ALUArg <= '0';
				-- subiu
				when "0010" => Beq <= '0'; Bne <= '1'; RegDest <= '1'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "110"; RegWrite <= '1'; ALUSrc <= '0'; JumpDest <= '1'; MemWrite <= '0'; LessThan <= '0'; ALUArg <= '0';
				-- subi
				when "0100" => Beq <= '0'; Bne <= '1'; RegDest <= '1'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "110"; RegWrite <= '1'; ALUSrc <= '0'; JumpDest <= '1'; MemWrite <= '0'; LessThan <= '0'; ALUArg <= '0';
				-- J
				when "0101" => Beq <= '0'; Bne <= '0'; RegDest <= '0'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "000"; RegWrite <= '0'; ALUSrc <= '0'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '0'; ALUArg <= '0';
				-- Jr
				when "0110" => Beq <= '0'; Bne <= '0'; RegDest <= '0'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "000"; RegWrite <= '0'; ALUSrc <= '0'; JumpDest <= '0'; LessThan <= '0'; MemWrite <= '0'; ALUArg <= '0';
				-- beq
				when "1000" => Beq <= '1'; Bne <= '1'; RegDest <= '0'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "110"; RegWrite <= '0'; ALUSrc <= '1'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '0'; ALUArg <= '0';
				-- bne
				when "1001" => Beq <= '0'; Bne <= '0'; RegDest <= '0'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "110"; RegWrite <= '0'; ALUSrc <= '1'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '0'; ALUArg <= '0';
				-- slt
				when "1010" => Beq <= '0'; Bne <= '1'; RegDest <= '1'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "110"; RegWrite <= '1'; ALUSrc <= '1'; JumpDest <= '1'; LessThan <= '1'; MemWrite <= '0'; ALUArg <= '1';
				-- lw
				when "1011" => Beq <= '0'; Bne <= '1'; RegDest <= '1'; MemRead <= '1'; MemToReg <= '1'; ALUOp <= "000"; RegWrite <= '1'; ALUSrc <= '0'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '0'; ALUArg <= '0';
				-- sw
				when "1100" => Beq <= '0'; Bne <= '1'; RegDest <= '0'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "000"; RegWrite <= '0'; ALUSrc <= '0'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '1'; ALUArg <= '0';
				when others => Beq <= '0'; Bne <= '1'; RegDest <= '0'; MemRead <= '0'; MemToReg <= '0'; ALUOp <= "000"; RegWrite <= '0'; ALUSrc <= '0'; JumpDest <= '1'; LessThan <= '0'; MemWrite <= '1'; ALUArg <= '0';
			END case;
		END IF;
	END PROCESS update;
END dataflow;