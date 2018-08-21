library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gal_x is
	port (
		clk			:	 IN STD_LOGIC;
		SR16			:	 IN STD_LOGIC;
		wide_en		:	 IN STD_LOGIC;
		clk_sel		:	 IN STD_LOGIC;
		ctrl_turbo_n:	 IN STD_LOGIC;
		x				:	 IN STD_LOGIC_VECTOR(9 downto 0);
		clk_sig		:	 OUT STD_LOGIC;
		XRESN			:	 OUT STD_LOGIC;
		BEn			:	 OUT STD_LOGIC;
		BH				:	 OUT STD_LOGIC;
		HS				:	 OUT STD_LOGIC;
		XLE			:	 OUT STD_LOGIC
	);
end entity;

architecture rtl of gal_x is

signal clk_normal		: std_logic;
signal clk_turbo		: std_logic;

signal XRES			: std_logic;
signal XLDN			: std_logic;
signal BHS			: std_logic;
signal BHE			: std_logic;
signal BHE_clk		: std_logic;
signal HS_3			: std_logic;
signal HS_4			: std_logic;
signal HS_pre		: std_logic;
signal HS_f			: std_logic;
signal XLE_3		: std_logic;
signal XLE_4		: std_logic;
signal XLE_pre		: std_logic;
signal XLE_f		: std_logic;

begin

clk_normal <= x(2);
clk_turbo <= x(1) when (clk_sel = '0')
		  else x(0);
clk_sig <= clk_turbo when (ctrl_turbo_n = '0')
		else clk_normal;

BEn <= not (x(0) and x(1) and x(2));
XRES <= '1' when (x="1100011111") else '0';	-- 799
XRESN <= not XRES;

-- horizontal blanking signal
BH_pr: process (clk)
begin
	if (rising_edge(clk)) then
		if (x = "0000000111") then -- 7
			BH <= '0';
		elsif (((x = "0110000111") and (SR16='0')) or ((x = "1000000111") and (SR16='1'))) then	-- 391 519
			BH <= '1';
		end if;
	end if;
end process;

-- horizontal sync signal
HS <= (not HS_pre) when (wide_en='1') else HS_pre;

HS_pr: process (clk)
begin
	if (rising_edge(clk)) then
		if (((x = "1000010111") and (SR16 = '0')) or ((x = "1001010111") and (SR16 = '1'))) then	-- 535 599
			HS_pre <= '1';
		elsif (((x = "1001111101") and (SR16 = '0')) or ((x = "1010110111") and (SR16 = '1'))) then	-- 637 695
			HS_pre <= '0';
		end if;
	end if;
end process;

-- X line end signal
XLE_3 <= '1' when (x="1010100111") else '0';	-- 679
XLE_4 <= '1' when (x="1011100111") else '0';	-- 743
XLE <= XLE_3 when (SR16='0') else XLE_4;


end rtl;
