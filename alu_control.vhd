library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY alu_control IS
	PORT(immediate_op : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- bottom three bits of instruction
		control_op : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- three bits from control
		alu_src : IN BIT; -- 1 if using immediate, 0 if using control
	    result : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)); -- result
END alu_control;

ARCHITECTURE dataflow OF alu_control IS
BEGIN
	PROCESS(immediate_op, control_op, alu_src) -- alter values on change
	BEGIN
		CASE alu_src IS
			WHEN '0' =>
				result <= control_op;
			WHEN '1' =>
				result <= immediate_op;
		END CASE;
	END PROCESS;
END dataflow;