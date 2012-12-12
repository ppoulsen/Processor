library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY alu IS
	PORT(x, y : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- input args
		opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- opcodes for defined in excel
	    output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	    less_than : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	    zero : OUT BIT);
END alu;

ARCHITECTURE dataflow OF alu IS
BEGIN
	PROCESS(x, y, opcode) -- alter values on change
	VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0); -- result
	BEGIN
		CASE opcode IS
			WHEN "000" =>
				result := x AND y;
			WHEN "001" =>
				result := x OR y;
			WHEN "010" =>
				result := x XOR y;
			WHEN "011" =>
				result := STD_LOGIC_VECTOR(UNSIGNED(x) SLL TO_INTEGER(UNSIGNED(y)));
			WHEN "100" =>
				result := STD_LOGIC_VECTOR(UNSIGNED(x) SRL TO_INTEGER(UNSIGNED(y)));
			WHEN "101" =>
				result := STD_LOGIC_VECTOR(UNSIGNED(x) + UNSIGNED(y));
			WHEN "110" =>
				result := STD_LOGIC_VECTOR(UNSIGNED(x) - UNSIGNED(y));
				
			WHEN OTHERS =>
				result := "00000000";
		END CASE;
		IF result = "00000000" THEN
			zero <= '1';
		ELSE
			zero <= '0';
		END IF;
		IF result(7) = '0' THEN
			less_than <= "00000000";
		ELSE
			less_than <= "00000001";
		END IF;
		output <= result;
	END PROCESS;
END dataflow;