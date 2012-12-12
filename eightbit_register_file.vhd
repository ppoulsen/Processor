library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Source: user Mohammed A khader at http://www.velocityreviews.com/forums/t23463-vhdl-register-file-synthesis.html for example

ENTITY eightbit_register_file IS
	GENERIC(data_size : NATURAL := 8;
			addr_size : NATURAL := 3);
	
	PORT(data_in : IN UNSIGNED(7 DOWNTO 0); -- incoming data
		write_reg : IN UNSIGNED(2 DOWNTO 0); -- register to write to
		read_reg1 : IN UNSIGNED(2 DOWNTO 0); -- read register 1
		read_reg2 : IN UNSIGNED(2 DOWNTO 0); -- read register 2
		reg_write : IN STD_LOGIC; -- reg_write enable (from controller)
		clk_in : IN STD_LOGIC; -- clk enable
		clk_write : IN STD_LOGIC; -- clk write
		out1 : OUT UNSIGNED(7 DOWNTO 0); -- read_reg1 value
		out2 : OUT UNSIGNED(7 DOWNTO 0)); -- read_reg2 value
END ENTITY eightbit_register_file;

ARCHITECTURE dataflow OF eightbit_register_file IS
	-- Register File Array
	TYPE eightbit_Register IS ARRAY (NATURAL RANGE<>) OF UNSIGNED(7 DOWNTO 0);
	SIGNAL regfile : eightbit_Register(0 TO 7);
	SIGNAL savedWriteRegister : UNSIGNED(2 DOWNTO 0);
	BEGIN
		-- read?
		read_operation : PROCESS(clk_in)
		BEGIN
			IF(RISING_EDGE(clk_in)) THEN
				-- Set output registers always
				out1 <= regfile(TO_INTEGER(UNSIGNED(read_reg1)));
				out2 <= regfile(TO_INTEGER(UNSIGNED(read_reg2)));
				regfile(0) <= regfile(0);
				regfile(1) <= regfile(1);
				regfile(2) <= regfile(2);
				regfile(3) <= regfile(3);
				regfile(4) <= regfile(4);
				regfile(5) <= regfile(5);
				regfile(6) <= regfile(6);
				regfile(7) <= regfile(7);
				savedWriteRegister <= write_reg;
			END IF;
		END PROCESS read_operation;
		
		-- Write?
		write_operation : PROCESS(clk_write)
		BEGIN
			IF(RISING_EDGE(clk_write)) THEN
				IF(reg_write = '1') THEN
					regfile(TO_INTEGER(UNSIGNED(savedWriteRegister))) <= data_in;
				END IF;
			END IF;
		END PROCESS write_operation;
END ARCHITECTURE dataflow;