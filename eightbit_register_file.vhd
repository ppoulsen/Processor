library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Source: user Mohammed A khader at http://www.velocityreviews.com/forums/t23463-vhdl-register-file-synthesis.html for example

ENTITY eightbit_register_file IS
	GENERIC(data_size : NATURAL := 8;
			addr_size : NATURAL := 3);
	
	PORT(data_in : IN UNSIGNED(data_size-1 DOWNTO 0); -- incoming data
		write_reg : IN UNSIGNED(addr_size-1 DOWNTO 0); -- register to write to
		read_reg1 : IN UNSIGNED(addr_size-1 DOWNTO 0); -- read register 1
		read_reg2 : IN UNSIGNED(addr_size-1 DOWNTO 0); -- read register 2
		reg_write : IN STD_LOGIC; -- reg_write enable (from controller)
		clk_in : IN STD_LOGIC; -- clk enable
		out1 : OUT UNSIGNED(data_size-1 DOWNTO 0); -- read_reg1 value
		out2 : OUT UNSIGNED(data_size-1 DOWNTO 0)); -- read_reg2 value
END ENTITY eightbit_register_file;

ARCHITECTURE dataflow OF eightbit_register_file IS
	-- Register File Array
	TYPE eightbit_Register IS ARRAY (NATURAL RANGE<>) OF UNSIGNED(data_size-1 DOWNTO 0);
	SIGNAL regfile : eightbit_Register(0 TO addr_size-1);
	BEGIN
		-- Set output registers always
		out1 <= regfile(TO_INTEGER(read_reg1));
		out2 <= regfile(TO_INTEGER(read_reg2));
		
		-- Write?
		write_operation : PROCESS(clk_in)
		BEGIN
			IF(RISING_EDGE(clk_in)) THEN
				IF(reg_write = '1') THEN
					regfile(TO_INTEGER(write_reg)) <= data_in;
				END IF;
			END IF;
		END PROCESS write_operation;
END ARCHITECTURE dataflow;