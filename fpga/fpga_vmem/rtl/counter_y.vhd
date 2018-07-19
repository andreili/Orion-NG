library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter_y is
	port (
		clk			:	 IN STD_LOGIC;
		XLE			:	 IN STD_LOGIC;
		wide_en		:	 IN STD_LOGIC;
		y				:	 OUT STD_LOGIC_VECTOR(9 downto 0);
		BV				:	 OUT STD_LOGIC;
		int50			:	 OUT STD_LOGIC;
		VS				:	 OUT STD_LOGIC
	);
end entity;

architecture rtl of counter_y is

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

signal ys			: std_logic_vector(9 downto 0);
signal YRES_W		: std_logic;
signal YRES_N		: std_logic;
signal YRESN		: std_logic;
signal YLDN			: std_logic;
signal VS_1			: std_logic;
signal VS_W			: std_logic;
signal VS_N			: std_logic;
signal VS_pre		: std_logic;

signal BV_inner	: std_logic;
signal frame		: std_logic_vector(2 downto 0);

begin

y <= ys;

YRES_W <= '0' when (ys="0111000000") else '1';	-- 448
YRES_N <= '0' when (ys="1000001100") else '1';	-- 524
YRESN <= YRES_N when (wide_en='0') else YRES_W;
YLDN <= '1';

cnty: cnt_sync
	port map (
		clk and XLE,
		YRESN,
		YLDN,
		"0000000000",
		ys
	);

BV_inner <= ys(9) or ys(8);
BV <= BV_inner;

-- vertical sync signal
VS_pr: process (XLE)
begin
	if (rising_edge(XLE)) then
		if (((ys = "0101111001") and (wide_en='0')) or ((ys = "0101010100") and (wide_en='1'))) then	-- 377 340
			VS <= '0';
		elsif (((ys = "0101111011") and (wide_en='0')) or ((ys = "0101010110") and (wide_en='1'))) then	-- 379 342
			VS <= '1';
		end if;
	end if;
end process;

process (BV_inner)
begin
	if (rising_edge(BV_inner)) then
		if (frame = "110") then
			frame <= "000";
		else
			frame <= frame + '1';
		end if;
	end if;
end process;

int50 <= BV_inner when (frame /= "110") else '0';

end rtl;
