library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY alu IS
	PORT(x, y : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- input args
		opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- opcodes for defined in excel
		clk_in : STD_LOGIC;
	    output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	    less_than : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	    zero : OUT BIT);
END alu;

ARCHITECTURE dataflow OF alu IS
BEGIN
	PROCESS(clk_in) -- alter values on change
	BEGIN
		IF (RISING_EDGE(clk_in)) THEN
			CASE opcode IS
				WHEN "000" =>
					output <= x AND y;
				WHEN "001" =>
					output <= x OR y;
				WHEN "010" =>
					output <= x XOR y;
				WHEN "011" =>
					output <= STD_LOGIC_VECTOR(UNSIGNED(x) SLL TO_INTEGER(UNSIGNED(y)));
				WHEN "100" =>
					output <= STD_LOGIC_VECTOR(UNSIGNED(x) SRL TO_INTEGER(UNSIGNED(y)));
				WHEN "101" =>
					output <= STD_LOGIC_VECTOR(UNSIGNED(x) + UNSIGNED(y));
				WHEN "110" =>
					output <= STD_LOGIC_VECTOR(UNSIGNED(x) - UNSIGNED(y));
					IF (TO_INTEGER(UNSIGNED(x) - UNSIGNED(y)) = 0) THEN
						zero <= '1';
					ELSE
						zero <= '0';
					END IF;
					IF (STD_LOGIC_VECTOR(UNSIGNED(x) - UNSIGNED(y))(7) = '0') THEN
						less_than <= "00000000";
					ELSE
						less_than <= "00000001";
					END IF;
				WHEN OTHERS =>
					output <= "00000000";
			END CASE;
		END IF;
	END PROCESS;
END dataflow;