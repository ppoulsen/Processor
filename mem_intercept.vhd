library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY mem_intercept IS
	PORT(address_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		sw : IN BIT;
		lw : IN BIT;
		clk_in : IN STD_LOGIC;
	    display_1_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	    display_2_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	    ram_a_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	    ram_d_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	    read_switch : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	    decimal_1 : OUT STD_LOGIC;
	    decimal_2 : OUT STD_LOGIC
	    );
END mem_intercept;

ARCHITECTURE dataflow OF mem_intercept IS
BEGIN
	PROCESS (clk_in)
	BEGIN
		IF (RISING_EDGE(clk_in)) THEN
			IF (sw = '0' AND lw = '1') THEN
				CASE address_in IS
					when "00000000" => read_switch <= "00";
					when "00000001" => read_switch <= "01";
					when "00000010" => read_switch <= "10";
					when others => read_switch <= "11";
				END CASE;
			ELSIF (sw = '1' AND lw = '0') THEN
				CASE address_in IS
					when "00000000" => display_1_out <= data_in(7 DOWNTO 4); display_2_out <= data_in(3 DOWNTO 0);
					when "00000001" => decimal_1 <= data_in(0);
					when "00000010" => decimal_2 <= data_in(0);
					when others => null;
				END CASE;
			END IF;
			ram_a_out <= address_in;
			ram_d_out <= data_in;
		END IF;
	END PROCESS;
END dataflow;