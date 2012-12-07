LIBRARY ieee;
use ieee.std_logic_1164.all;

-- Program Counter
ENTITY program_counter IS
	PORT(	a_in : IN BIT_VECTOR(7 DOWNTO 0);
			clk_in : IN STD_LOGIC;
			a_out : OUT BIT_VECTOR(7 DOWNTO 0) );
END program_counter;

ARCHITECTURE dataflow OF program_counter IS
BEGIN
	-- update gets called when clk_in changes
	update: PROCESS (clk_in) is
	BEGIN
		-- if clock is on rising edge then update
		IF RISING_EDGE(clk_in) THEN
			a_out <= a_in;
		END IF;
	END PROCESS update;
END dataflow;