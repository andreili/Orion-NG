library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gal_x is
	port (
		SR16			:	 IN STD_LOGIC;
		wide_en		:	 IN STD_LOGIC;
		clk_sel		:	 IN STD_LOGIC;
		ctrl_turbo_n:	 IN STD_LOGIC;
		x				:	 IN STD_LOGIC_VECTOR(9 downto 0);
		col			:	 OUT STD_LOGIC_VECTOR(1 downto 0);
		clk_sig		:	 OUT STD_LOGIC;
		XRESN			:	 OUT STD_LOGIC;
		BEn			:	 OUT STD_LOGIC;
		BH				:	 OUT STD_LOGIC;
		HS				:	 OUT STD_LOGIC;
		XLE			:	 OUT STD_LOGIC
	);
end entity;

architecture rtl of gal_x is
signal XLDN			: std_logic;
signal HS_pre		: std_logic;

begin

XRESN <= not (x(9) and x(8) and x(4) and x(3) and x(2) and x(1) and x(0));

BEn <= not (x(0) and x(1) and x(2));

clk_sig <= (x(2) and ctrl_turbo_n) or 
			  (((x(0) and clk_sel) or 
			  (x(1) and (not clk_sel))) and (not ctrl_turbo_n));

BH <= (
	(not SR16) and ((not x(9)) and (((not x(8)) and x(7)) or
		((not x(7)) and (x(6) or x(5) or x(4) or x(3))) or
		(x(8) and (not x(6)) and (not x(5)) and (not x(4)) and (not x(3)))))) or
	(SR16 and (((not x(9)) and (x(8) or x(7) or x(6) or x(5) or x(4) or x(3))) or
		(x(9) and (not x(3)) and (not (x(8) or x(7) or x(6) or x(5) or x(4))))));

-- horizontal sync signal
HS_pre <= (((((not x(7)) and x(6) and x(5)) or (x(7) and (not x(6)))) and SR16) or 
			((not x(7)) and (x(6) or x(5) or (x(4) and x(3))) and (not SR16))) and 
			x(9) and (not x(8));
HS <= HS_pre xor wide_en;

-- X line end signal
XLE <= ((x(6) and SR16) or ((not x(6)) and (not SR16))) and 
			x(9) and (not x(8)) and x(7) and x(5) and (not x(4)) and (not x(3)) and x(2) and x(1) and x(0);

col(0) <= (not x(0)) and x(1) and (not x(2));
col(1) <= (not x(0)) and x(1) and x(2);

end rtl;
