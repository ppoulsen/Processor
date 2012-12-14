library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY sign_extender IS
	PORT(immediate6 : IN STD_LOGIC_VECTOR(5 DOWNTO 0); -- input args
	    immediate8 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- result
END sign_extender;

ARCHITECTURE dataflow OF sign_extender IS
BEGIN
	PROCESS(immediate6) -- alter values on immediate6 change
	BEGIN
		immediate8(7) <= '0';
		immediate8(6) <= '0';
		immediate8(5 DOWNTO 0) <= immediate6(5 DOWNTO 0);
	END PROCESS;
END dataflow;