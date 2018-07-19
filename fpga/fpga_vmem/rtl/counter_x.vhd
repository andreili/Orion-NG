library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter_x is
	port (
		clk			:	 IN STD_LOGIC;
		SR16			:	 IN STD_LOGIC;
		wide_en		:	 IN STD_LOGIC;
		x				:	 OUT STD_LOGIC_VECTOR(9 downto 0);
		BE				:	 OUT STD_LOGIC;
		BH				:	 OUT STD_LOGIC;
		HS				:	 OUT STD_LOGIC;
		XLE			:	 OUT STD_LOGIC
	);
end entity;

architecture rtl of counter_x is

	component cnt_sync is
		port (
			clk			:	 IN STD_LOGIC;
			res_n			:	 IN STD_LOGIC;
			ldn_n			:	 IN STD_LOGIC;
			ldn_val		:	 IN STD_LOGIC_VECTOR(9 downto 0);
			cnt			:	 OUT STD_LOGIC_VECTOR(9 downto 0)
		);
	end component;

	component cnt_10b
		PORT
		(
			clock		: IN STD_LOGIC ;
			sclr		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
		);
	end component;

signal xs			: std_logic_vector(9 downto 0);
signal XRES			: std_logic;
signal XRESN		: std_logic;
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

x <= xs;

BE <= xs(0) and xs(1) and xs(2);
XRES <= '1' when (xs="1100011111") else '0';	-- 799
XRESN <= not XRES;
XLDN <= '1';

cntx: cnt_sync
	port map (
		clk,
		XRESN,
		XLDN,
		"0000000000",
		xs
	);

-- horizontal blanking signal
BH_pr: process (clk)
begin
	if (rising_edge(clk)) then
		if (xs = "0000000111") then -- 7
			BH <= '0';
		elsif (((xs = "0110000111") and (SR16='0')) or ((xs = "1000000111") and (SR16='1'))) then	-- 391 519
			BH <= '1';
		end if;
	end if;
end process;

-- horizontal sync signal
HS <= (not HS_pre) when (wide_en='1') else HS_pre;

HS_pr: process (clk)
begin
	if (rising_edge(clk)) then
		if (((xs = "1000010111") and (SR16 = '0')) or ((xs = "1001010111") and (SR16 = '1'))) then	-- 535 599
			HS_pre <= '1';
		elsif (((xs = "1001111101") and (SR16 = '0')) or ((xs = "1010110111") and (SR16 = '1'))) then	-- 637 695
			HS_pre <= '0';
		end if;
	end if;
end process;

-- X line end signal
XLE_3 <= '1' when (xs="1010100111") else '0';	-- 679
XLE_4 <= '1' when (xs="1011100111") else '0';	-- 743
XLE <= XLE_3 when (SR16='0') else XLE_4;


end rtl;
