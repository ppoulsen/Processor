library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY q_splitter IS
	PORT(q_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- bottom three bits of instruction
		out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		out2 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		out3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		out4 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		out5 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END q_splitter;

ARCHITECTURE dataflow OF q_splitter IS
BEGIN
	PROCESS(q_in) -- alter values on change
	BEGIN
		out1 <= q_in(15 DOWNTO 12);
		out2 <= q_in(11 DOWNTO 9);
		out3 <= q_in(8 DOWNTO 6);
		out4 <= q_in(5 DOWNTO 3);
		out5 <= q_in(5 DOWNTO 0);
	END PROCESS;
END dataflow;