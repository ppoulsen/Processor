LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY display_switch IS
	PORT(	led_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
			update : IN STD_LOGIC;
			switch : IN BIT;
			led_1_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			led_2_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
END display_switch;

ARCHITECTURE dataflow OF display_switch IS
BEGIN
	PROCESS (update)
	BEGIN
		IF (RISING_EDGE(update)) THEN
			IF (switch = '0') THEN
				led_1_out <= led_in;
			ELSE
				led_2_out <= led_in;
			END IF;
		END IF;
	END PROCESS;
END dataflow;
