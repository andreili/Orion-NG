-- altera vhdl_input_version vhdl_2008

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity i8255 is
	port (
		clk	: in    std_logic;
		dbus	: inout std_logic_vector(7 downto 0);
		addr	: in    std_logic_vector(1 downto 0);
		rd_n	: in    std_logic;
		wr_n	: in    std_logic;
		cs_n	: in    std_logic;
		res	: in    std_logic;
		
		PA		: inout std_logic_vector(7 downto 0);
		PB		: inout std_logic_vector(7 downto 0);
		PC		: inout std_logic_vector(7 downto 0)
	);
end entity;

architecture rtl of i8255 is

signal reg_A				: std_logic_vector(7 downto 0);
signal reg_B				: std_logic_vector(7 downto 0);
signal reg_C				: std_logic_vector(7 downto 0);
signal control_reg		: std_logic_vector(7 downto 0);

signal Ain					: std_logic_vector(7 downto 0);
signal Bin					: std_logic_vector(7 downto 0);
signal Cin					: std_logic_vector(7 downto 0);
signal Cinl					: std_logic_vector(3 downto 0);
signal Cinh					: std_logic_vector(3 downto 0);

begin

process (clk)
begin
	if (rising_edge(clk)) then
		if (res = '1') then
			reg_A <= (others => '0');
			reg_B <= (others => '0');
			reg_C <= (others => '0');
			control_reg <= X"9B";
		elsif ((cs_n = '0') and (wr_n = '0')) then
			case addr is
				when "00" => 	reg_A <= dbus;
				when "01" => 	reg_B <= dbus;
				when "10" =>	reg_C <= dbus;
				when "11" =>	NULL;
			end case;
			
			if (addr = "11") then	-- control register
				if (dbus(7) = '1') then	-- immediate value
					control_reg <= dbus;
				else	-- set/reset bit in port C
					if (dbus(1) = '1') then
						-- set bit
						case dbus(3 downto 1) is
							when "000" => 	reg_C(0) <= '1';
							when "001" => 	reg_C(1) <= '1';
							when "010" => 	reg_C(2) <= '1';
							when "011" => 	reg_C(3) <= '1';
							when "100" => 	reg_C(4) <= '1';
							when "101" => 	reg_C(5) <= '1';
							when "110" => 	reg_C(6) <= '1';
							when "111" => 	reg_C(7) <= '1';
						end case;
					else
						-- reset bit
						case dbus(3 downto 1) is
							when "000" => 	reg_C(0) <= '0';
							when "001" => 	reg_C(1) <= '0';
							when "010" => 	reg_C(2) <= '0';
							when "011" => 	reg_C(3) <= '0';
							when "100" => 	reg_C(4) <= '0';
							when "101" => 	reg_C(5) <= '0';
							when "110" => 	reg_C(6) <= '0';
							when "111" => 	reg_C(7) <= '0';
						end case;
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

process (clk)
begin
	if (rising_edge(clk)) then
		if (control_reg(4) = '1') then
			PA <= (others => 'Z');
		else
			PA <= reg_A;
		end if;

		if (control_reg(1) = '1') then
			PB <= (others => 'Z');
		else
			PB <= reg_B;
		end if;

		if (control_reg(0) = '1') then
			PC(3 downto 0) <= (others => 'Z');
		else
			PC(3 downto 0) <= reg_C(3 downto 0);
		end if;

		if (control_reg(3) = '1') then
			PC(7 downto 4) <= (others => 'Z');
		else
			PC(7 downto 4) <= reg_C(7 downto 4);
		end if;
	end if;
end process;

Ain	<= PA when (control_reg(4) = '1') else reg_A;
Bin	<= PB when (control_reg(1) = '1') else reg_B;
Cinl	<= PC(3 downto 0) when (control_reg(0) = '1') else reg_C(3 downto 0);
Cinh	<= PC(7 downto 4) when (control_reg(3) = '1') else reg_C(7 downto 4);
Cin	<= Cinh & Cinl;

process (clk)
begin
	if (rising_edge(clk)) then
		if ((cs_n = '0') and (rd_n = '0')) then
			case addr is
				when "00" => 	dbus <= Ain;
				when "01" => 	dbus <= Bin;
				when "10" =>	dbus <= Cin;
				when "11" =>	dbus <= control_reg;
			end case;
		else
			dbus <= (others => 'Z');
		end if;
	end if;
end process;

end rtl;
