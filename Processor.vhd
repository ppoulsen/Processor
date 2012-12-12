-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;

entity ProcessorPins is
	port
	(
		on_board_oscillator : in std_logic;
		FLEX_PB1 : in std_logic;
		FLEX_PB2 : in std_logic;
		FLEX_SWITCH_1 : in std_logic;
		FLEX_SWITCH_2 : in std_logic;
		FLEX_SWITCH_3 : in std_logic;
		FLEX_SWITCH_4 : in std_logic;
		FLEX_SWITCH_5 : in std_logic;
		FLEX_SWITCH_6 : in std_logic;
		FLEX_SWITCH_7 : in std_logic;
		FLEX_SWITCH_8 : in std_logic;
		a_1 : in std_logic;
		b_1 : in std_logic;
		c_1 : in std_logic;
		d_1 : in std_logic;
		e_1 : in std_logic;
		f_1 : in std_logic;
		g_1 : in std_logic;
		decimal_1 : in std_logic;
		a_2 : in std_logic;
		b_2 : in std_logic;
		c_2 : in std_logic;
		d_2 : in std_logic;
		e_2 : in std_logic;
		f_2 : in std_logic;
		g_2 : in std_logic;
		decimal_2 : in std_logic
	);

end ProcessorPins;

architecture ppl_type of ProcessorPins is

begin

end;
