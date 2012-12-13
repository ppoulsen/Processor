LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY read_mux IS
	PORT(	read_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			dip_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			left_in : IN STD_LOGIC;
			right_in : IN STD_LOGIC;
			ram_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			mux_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END read_mux;

ARCHITECTURE dataflow OF read_mux IS
BEGIN
	PROCESS (read_in, dip_in, ram_in, left_in, right_in)
	BEGIN
		CASE read_in IS
			when "00" => mux_out <= dip_in(7 DOWNTO 0);
			when "01" => mux_out(0) <= left_in; mux_out(7 DOWNTO 1) <= "0000000";
			when "10" => mux_out(0) <= right_in; mux_out(7 DOWNTO 1) <= "0000000";
			when "11" => mux_out <= ram_in;
		END CASE;
	END PROCESS;
END dataflow;
