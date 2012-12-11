library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY alu IS
	PORT(x, y : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- input args
		opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- opcodes for defined in excel
	    result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- result
	    less_than : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	    zero : OUT BIT;
END alu;

ARCHITECTURE dataflow OF alu IS
BEGIN
	PROCESS(x, y, opcode) -- alter values on change
	VARIABLE to_shift: UNSIGNED := UNSIGNED(x);
	VARIABLE shift: INTEGER := TO_INTEGER(UNSIGNED(y));
	VARIABLE shifted: UNSIGNED;
	BEGIN
		CASE opcode IS
			WHEN "000" =>
				result <= x AND y;
			WHEN "001" =>
				result <= x OR y;
			WHEN "010" =>
				result <= x XOR y;
			WHEN "011" =>
				result <= STD_LOGIC_VECTOR(to_shift SLL shift);
			WHEN "100" =>
				result <= STD_LOGIC_VECTOR(to_shift SRL shift);
			WHEN "101" =>
				result <= STD_LOGIC_VECTOR(UNSIGNED(x) + UNSIGNED(y));
			WHEN "110" =>
				result <= STD_LOGIC_VECTOR(UNSIGNED(x) - UNSIGNED(y));
				CASE result(7) IS
					WHEN '0' =>
						less_than <= "00000000";
					WHEN OTHERS =>
						less_than <= "00000001";
				END CASE;
			WHEN OTHERS =>
				result <= "00000000";
		END CASE;
		IF result = "00000000" THEN
			zero = '1';
		ELSE
			zero = '0';
		END IF;
	END PROCESS;
END dataflow;