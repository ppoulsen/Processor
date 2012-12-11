LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Program Counter
ENTITY adder IS
	PORT(	a_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			a_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END adder;

ARCHITECTURE dataflow OF adder IS
BEGIN
	PROCESS (a_in)
	BEGIN
		a_out <= STD_LOGIC_VECTOR(UNSIGNED(a_in) + 2);
	END PROCESS;
END dataflow;