library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gal_y is
	port (
		clk			:	 IN STD_LOGIC;
		wide_en		:	 IN STD_LOGIC;
		BH				:	 IN STD_LOGIC;
		y				:	 IN STD_LOGIC_VECTOR(9 downto 0);
		YRESN			:	 OUT STD_LOGIC;
		blank_n		:	 OUT STD_LOGIC;
		int50			:	 OUT STD_LOGIC;
		VS				:	 OUT STD_LOGIC
	);
end entity;

architecture rtl of gal_y is

signal YRES_W		: std_logic;
signal YRES_N		: std_logic;
signal VS_1			: std_logic;
signal VS_W			: std_logic;
signal VS_N			: std_logic;
signal VS_pre		: std_logic;

signal BV			: std_logic;
signal frame		: std_logic_vector(2 downto 0);

begin

YRES_W <= '0' when (y="0111000000") else '1';	-- 448
YRES_N <= '0' when (y="1000001100") else '1';	-- 524
YRESN <= YRES_N when (wide_en='0') else YRES_W;

BV <= y(9) or y(8);

-- vertical sync signal
VS_pr: process (clk)
begin
	if (rising_edge(clk)) then
		if (((y = "0101111001") and (wide_en='0')) or ((y = "0101010100") and (wide_en='1'))) then	-- 377 340
			VS <= '0';
		elsif (((y = "0101111011") and (wide_en='0')) or ((y = "0101010110") and (wide_en='1'))) then	-- 379 342
			VS <= '1';
		end if;
	end if;
end process;

process (BV)
begin
	if (rising_edge(BV)) then
		if (frame = "110") then
			frame <= "000";
		else
			frame <= frame + '1';
		end if;
	end if;
end process;

int50 <= BV when (frame /= "110") else '0';

blank_n <= (not BH) and (not BV);

end rtl;
