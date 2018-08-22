library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gal_y is
	port (
		clk			:	 IN STD_LOGIC;
		wide_en		:	 IN STD_LOGIC;
		BH				:	 IN STD_LOGIC;
		XRESN			:	 IN STD_LOGIC;
		y				:	 IN STD_LOGIC_VECTOR(9 downto 0);
		YRESN			:	 OUT STD_LOGIC;
		blank_n		:	 OUT STD_LOGIC;
		int50			:	 OUT STD_LOGIC;
		VS				:	 OUT STD_LOGIC
	);
end entity;

architecture rtl of gal_y is

--signal BV			: std_logic;
signal frame		: std_logic_vector(2 downto 0);

begin

YRESN <= not ((wide_en and y(9) and y(3) and y(2)) or ((not wide_en) and y(8) and y(7) and y(6)));

VS <= not ((((not y(5)) and (not y(3)) and y(2) and (not y(1)) and wide_en) or 
			(y(5) and y(3) and (not y(2)) and y(1) and (not wide_en))) and 
			(not y(9)) and y(8) and (not y(7)) and y(6) and y(4));

process (y(9), YRESN)
begin
	if (XRESN = '0') then
		int50 <= '1';
	elsif (rising_edge(y(9))) then
		int50 <= '0';
	end if;
end process;

blank_n <= BH and (not y(9)) and (not y(8));

end rtl;
