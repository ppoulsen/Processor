LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY mux IS
	PORT(	mux1_a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			mux1_b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			mux1_choice : IN BIT;
			mux1_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END mux;

ARCHITECTURE dataflow OF mux IS
BEGIN
	PROCESS (mux1_choice)
	BEGIN
		if (mux1_choice = '0') THEN
			mux1_out <= mux1_a;
		ELSE
			mux1_out <= mux1_b;
		END IF;
	END PROCESS;
END dataflow;
