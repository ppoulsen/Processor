LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY mux_3bit IS
	PORT(	mux2_a : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			mux2_b : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			mux2_choice : IN BIT;
			mux2_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
		);
END mux_3bit;

ARCHITECTURE dataflow OF mux_3bit IS
BEGIN
	PROCESS (mux2_choice, mux2_a, mux2_b)
	BEGIN
		if (mux2_choice = '0') THEN
			mux2_out <= mux2_a;
		ELSE
			mux2_out <= mux2_b;
		END IF;
	END PROCESS;
END dataflow;
