LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY adder IS
	PORT(	adder_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			adder_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END adder;

ARCHITECTURE dataflow OF adder IS
BEGIN
	PROCESS (adder_in)
	BEGIN
		adder_out <= STD_LOGIC_VECTOR(UNSIGNED(adder_in) + 1);
	END PROCESS;
END dataflow;