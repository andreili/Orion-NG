-- altera vhdl_input_version vhdl_2008

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod_pio is
	port (
		clk			: in  std_logic;	-- 25MHz
		resetn		: in  std_logic;

		addr			: in  std_logic_vector(15 downto 0);
		data			: inout std_logic_vector(7 downto 0);
		rdn			: in  std_logic;
		wrn			: in  std_logic;
		blion			: in  std_logic;
		iorqn			: in  std_logic;
		mreqn			: in  std_logic;
		waitn			: out std_logic;
		
		btn_cc		: in std_logic;
		btn_uc		: in std_logic;
		btn_rl		: in std_logic;
		
		mg_in			: in  std_logic;
		mg_out		: out std_logic;
		led_rl		: out std_logic;

		romd_strobe	: out std_logic;
		romd_csn		: out std_logic;
		romd_idx		: out std_logic_vector(3 downto 0);
		romd_abus	: out std_logic_vector(7 downto 0);
		romd_dbus	: in std_logic_vector(7 downto 0);
		
		sintn			: out std_logic;
		swrn			: in std_logic;
		srdn			: in std_logic;
		sok			: in std_logic;
		sreg_idx		: in std_logic_vector(2 downto 0);
		sdata			: inout std_logic_vector(10 downto 0)
	);
end entity;

architecture rtl of mod_pio is

	component vv55_emu is
		port (
			clk			: in  std_logic;
			resetn		: in  std_logic;

			addr			: in  std_logic_vector(1 downto 0);
			data			: inout std_logic_vector(7 downto 0);
			rdn			: in  std_logic;
			wrn			: in  std_logic;
			cs				: in  std_logic;
			
			mg_in			: in  std_logic;
			mg_out		: out std_logic;
		
			row_in		: out std_logic;
			col_in		: out std_logic;
			kbd_rd_row	: inout std_logic_vector(7 downto 0);
			kbd_rd_col	: inout std_logic_vector(11 downto 0)
		);
	end component;

signal fxxx					: std_logic;
signal f4xx					: std_logic;
signal fhxx					: std_logic;
signal fhxx_sel			: std_logic;
signal Ox_sel				: std_logic;
signal pmF4					: std_logic;
signal pFB					: std_logic;
signal pmF5					: std_logic;
signal p08					: std_logic;
signal p18					: std_logic;
signal p28					: std_logic;
signal cs_F4				: std_logic;
signal cs_ROM				: std_logic;
signal ctrl_o128			: std_logic;
signal z80_port_en		: std_logic;
signal p0A_wr				: std_logic;
signal z80_full_RAM		: std_logic;

signal sintn_in			: std_logic;
signal stm_int_req		: std_logic;
signal stm_int_vector	: std_logic_vector(7 downto 0);

signal vv_reg_0			: std_logic_vector(7 downto 0);
signal vv_reg_1			: std_logic_vector(7 downto 0);
signal vv_reg_2			: std_logic_vector(7 downto 0);
signal vv_reg_3			: std_logic_vector(7 downto 0);

signal kbd_row_0			: std_logic_vector(7 downto 0);
signal kbd_row_1			: std_logic_vector(7 downto 0);
signal kbd_row_2			: std_logic_vector(7 downto 0);
signal kbd_row_3			: std_logic_vector(7 downto 0);
signal kbd_row_4			: std_logic_vector(7 downto 0);
signal kbd_row_5			: std_logic_vector(7 downto 0);
signal kbd_row_6			: std_logic_vector(7 downto 0);
signal kbd_row_7			: std_logic_vector(7 downto 0);

begin

-- ports decoding
fxxx <= addr(12) and addr(13) and addr(14) and addr(15) and ctrl_o128 and z80_port_en;
f4xx <= fxxx and (not addr(11)) and addr(10);
fhxx <= iorqn or (not (blion and addr(3) and addr(4) and addr(5) and addr(6)));
fhxx_sel <= addr(7) and (not (wrn)) and (not fhxx);
Ox_sel <= (blion and (not (addr(5) or addr(6)))) and (not addr(7)) and (not iorqn) and (not ctrl_o128);
pmF4 <= f4xx and    addr(10)  and (not addr(9)) and (not addr(8));
pmF5 <= f4xx and    addr(10)  and (not addr(9)) and      addr(8);
pFB  <= fhxx_sel and      addr(0)  and      addr(1)  and (not addr(2));
p08 <= Ox_sel and (not addr(2)) and addr(3) and (not addr(4));
p18 <= Ox_sel and (not addr(2)) and addr(3) and addr(4);
p28 <= blion and (not addr(7)) and addr(6) and (not addr(5)) and (not addr(4)) and (not addr(3)) and (not addr(2)) and (not iorqn);
cs_F4 <= p18 or pmF4;
cs_ROM <= pmF5 or p28;

-- memory controls
p0A_wr <= (not wrn) and P08 and addr(1) and (not addr(0));
process (resetn, p0A_wr)
begin
	if (resetn = '0') then
		ctrl_o128 <= '0';
	elsif (falling_edge(p0A_wr)) then
		ctrl_o128 <= data(7);
	end if;
end process;

-- Z80-Card-II
z80_port_en <= not (z80_full_RAM or (not addr(15)));
FB: process (pFB, resetn)
begin
	if (resetn = '0') then
		z80_full_RAM <= '0';
	elsif (falling_edge(pFB)) then
		z80_full_RAM <= data(5);
	end if;
end process;

--STM32 signals
stm_int_req <= cs_F4 and ((not wrn) or (not rdn));

sint_pr: process (resetn, srdn, stm_int_req)
begin
	if (resetn = '0') or (srdn = '0') then
		sintn_in <= '1';
	elsif (rising_edge(stm_int_req)) then
		if ((srdn='1') and (swrn='1')) then
			--sintn_in <= '0';
		end if;
		stm_int_vector(1 downto 0) <= addr(1 downto 0);
		stm_int_vector(2) <= cs_F4;
		stm_int_vector(7) <= wrn;
	end if;
end process;
sintn <= sintn_in;

sdata <= --"000" & stm_int_vector when ((swrn='1') and (srdn='1'))
	 --else "000" & data when ((srdn='0') and (sreg_idx="111"))
	 --else (others => 'Z');
	 (others => 'Z');

process (swrn)
begin
	if (rising_edge(swrn)) then
		case sreg_idx is
			when "000" => kbd_row_0 <= sdata(7 downto 0);
			when "001" => kbd_row_1 <= sdata(7 downto 0);
			when "010" => kbd_row_2 <= sdata(7 downto 0);
			when "011" => kbd_row_3 <= sdata(7 downto 0);
			when "100" => kbd_row_4 <= sdata(7 downto 0);
			when "101" => kbd_row_5 <= sdata(7 downto 0);
			when "110" => kbd_row_6 <= sdata(7 downto 0);
			when "111" => kbd_row_7 <= sdata(7 downto 0);
			when others => NULL;
		end case;
	end if;
end process;

-- CPU /WAIT signal generation
/*process (clk)
begin
	if (sok = '1') then
		waitn <= '1';
	elsif (rising_edge(clk)) then
		if (stm_int_req = '1') then
			waitn <= '0';
		end if;
	end if;
end process;*/

waitn <= '1';

-- VV55
process (clk)
begin
	if (rising_edge(clk)) then
		if ((cs_F4 = '1') and (wrn = '0') and (addr(1 downto 0) = "00")) then
			vv_reg_0 <= data;
		end if;
	end if;
end process;

process (clk)
begin
	if (rising_edge(clk)) then
		if ((cs_F4 = '1') and (wrn = '0') and (addr(1 downto 0) = "11") and (vv_reg_3(0) = '0') and (data(7) = '0') and (data(3) = '0')) then
			case data(2 downto 1) is
				when "00" => 	vv_reg_2(0) <= data(0);
				when "01" => 	vv_reg_2(1) <= data(0);
				when "10" => 	vv_reg_2(2) <= data(0);
				when "11" => 	vv_reg_2(3) <= data(0);
			end case;
		elsif ((cs_F4 = '1') and (wrn = '0') and (addr(1 downto 0) = "10") and (vv_reg_3(0) = '0')) then
			vv_reg_2(3 downto 0) <= data(3 downto 0);
		end if;
	end if;
end process;

process (resetn, clk)
begin
	if (resetn = '0') then
		vv_reg_3 <= X"9B";
	elsif (rising_edge(clk)) then
		if ((cs_F4 = '1') and (wrn = '0') and (addr(1 downto 0) = "11") and (data(7) = '1')) then
			vv_reg_3 <= data;
		end if;
	end if;
end process;

data <= vv_reg_1 when ((cs_F4 = '1') and (rdn = '0') and (addr(1 downto 0) = "01"))
	else vv_reg_2 when ((cs_F4 = '1') and (rdn = '0') and (addr(1 downto 0) = "10"))
	--else sdata(7 downto 0) when ((swrn='0') and (sreg_idx="111"))
	else romd_dbus when ((cs_ROM='1') and (rdn='0') and (addr(1) = '1') and (addr(0) = '0'))
	else (others => 'Z');

mg_out <= vv_reg_2(0);
led_rl <= vv_reg_2(3);
vv_reg_2(4) <= mg_in;
vv_reg_2(5) <= btn_cc;
vv_reg_2(6) <= btn_uc;
vv_reg_2(7) <= btn_rl;

-- matrix
vv_reg_1(0) <= (kbd_row_0(0) or vv_reg_0(0)) and
					(kbd_row_1(0) or vv_reg_0(1)) and
					(kbd_row_2(0) or vv_reg_0(2)) and
					(kbd_row_3(0) or vv_reg_0(3)) and
					(kbd_row_4(0) or vv_reg_0(4)) and
					(kbd_row_5(0) or vv_reg_0(5)) and
					(kbd_row_6(0) or vv_reg_0(6)) and
					(kbd_row_7(0) or vv_reg_0(7));
vv_reg_1(1) <= (kbd_row_0(1) or vv_reg_0(0)) and
					(kbd_row_1(1) or vv_reg_0(1)) and
					(kbd_row_2(1) or vv_reg_0(2)) and
					(kbd_row_3(1) or vv_reg_0(3)) and
					(kbd_row_4(1) or vv_reg_0(4)) and
					(kbd_row_5(1) or vv_reg_0(5)) and
					(kbd_row_6(1) or vv_reg_0(6)) and
					(kbd_row_7(1) or vv_reg_0(7));
vv_reg_1(2) <= (kbd_row_0(2) or vv_reg_0(0)) and
					(kbd_row_1(2) or vv_reg_0(1)) and
					(kbd_row_2(2) or vv_reg_0(2)) and
					(kbd_row_3(2) or vv_reg_0(3)) and
					(kbd_row_4(2) or vv_reg_0(4)) and
					(kbd_row_5(2) or vv_reg_0(5)) and
					(kbd_row_6(2) or vv_reg_0(6)) and
					(kbd_row_7(2) or vv_reg_0(7));
vv_reg_1(3) <= (kbd_row_0(3) or vv_reg_0(0)) and
					(kbd_row_1(3) or vv_reg_0(1)) and
					(kbd_row_2(3) or vv_reg_0(2)) and
					(kbd_row_3(3) or vv_reg_0(3)) and
					(kbd_row_4(3) or vv_reg_0(4)) and
					(kbd_row_5(3) or vv_reg_0(5)) and
					(kbd_row_6(3) or vv_reg_0(6)) and
					(kbd_row_7(3) or vv_reg_0(7));
vv_reg_1(4) <= (kbd_row_0(4) or vv_reg_0(0)) and
					(kbd_row_1(4) or vv_reg_0(1)) and
					(kbd_row_2(4) or vv_reg_0(2)) and
					(kbd_row_3(4) or vv_reg_0(3)) and
					(kbd_row_4(4) or vv_reg_0(4)) and
					(kbd_row_5(4) or vv_reg_0(5)) and
					(kbd_row_6(4) or vv_reg_0(6)) and
					(kbd_row_7(4) or vv_reg_0(7));
vv_reg_1(5) <= (kbd_row_0(5) or vv_reg_0(0)) and
					(kbd_row_1(5) or vv_reg_0(1)) and
					(kbd_row_2(5) or vv_reg_0(2)) and
					(kbd_row_3(5) or vv_reg_0(3)) and
					(kbd_row_4(5) or vv_reg_0(4)) and
					(kbd_row_5(5) or vv_reg_0(5)) and
					(kbd_row_6(5) or vv_reg_0(6)) and
					(kbd_row_7(5) or vv_reg_0(7));
vv_reg_1(6) <= (kbd_row_0(6) or vv_reg_0(0)) and
					(kbd_row_1(6) or vv_reg_0(1)) and
					(kbd_row_2(6) or vv_reg_0(2)) and
					(kbd_row_3(6) or vv_reg_0(3)) and
					(kbd_row_4(6) or vv_reg_0(4)) and
					(kbd_row_5(6) or vv_reg_0(5)) and
					(kbd_row_6(6) or vv_reg_0(6)) and
					(kbd_row_7(6) or vv_reg_0(7));
vv_reg_1(7) <= (kbd_row_0(7) or vv_reg_0(0)) and
					(kbd_row_1(7) or vv_reg_0(1)) and
					(kbd_row_2(7) or vv_reg_0(2)) and
					(kbd_row_3(7) or vv_reg_0(3)) and
					(kbd_row_4(7) or vv_reg_0(4)) and
					(kbd_row_5(7) or vv_reg_0(5)) and
					(kbd_row_6(7) or vv_reg_0(6)) and
					(kbd_row_7(7) or vv_reg_0(7));

-- ROM-disk
romd_idx <= "1110" when ((cs_ROM='1') and (wrn='0') and (addr(1) = '0') and (addr(0) = '0'))	-- A0-A7
		 else "1101" when ((cs_ROM='1') and (wrn='0') and (addr(1) = '0') and (addr(0) = '1'))	-- A8-A15
		 else "1111";
romd_csn <= '0' when ((cs_ROM='1') and (rdn='0') and (addr(1) = '1') and (addr(0) = '0'))
		 else '1';
romd_abus <= data when ((cs_ROM='1') and (wrn='0') and (addr(1) = '0'))
		 else (others => 'Z');
			
end rtl;
