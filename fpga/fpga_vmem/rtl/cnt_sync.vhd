library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cnt_sync is
	port (
		clk			:	 IN STD_LOGIC;
		res_n			:	 IN STD_LOGIC;
		ldn_n			:	 IN STD_LOGIC;
		ldn_val		:	 IN STD_LOGIC_VECTOR(9 downto 0);
		cnt			:	 OUT STD_LOGIC_VECTOR(9 downto 0)
	);
end entity;

architecture rtl of cnt_sync is

signal cnt_async	: std_logic_vector(9 downto 0);

begin

x_cnt: process (clk, res_n, ldn_n)
begin
	if (rising_edge(clk)) then
		if (res_n = '0') then
			cnt_async <= (others => '0');
		elsif (ldn_n = '0') then
			cnt_async <= ldn_val;
		else
			cnt_async <= cnt_async + '1';
		end if;
	end if;
end process;

xsync: process (clk)
begin
	if (falling_edge(clk)) then
		cnt <= cnt_async;
	end if;
end process;

end rtl;
