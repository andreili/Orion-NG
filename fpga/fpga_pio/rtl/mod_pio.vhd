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
		
		sintn			: out std_logic;
		swrn			: in std_logic;
		srdn			: in std_logic;
		sreg_idx		: in std_logic_vector(2 downto 0);
		sdata			: inout std_logic_vector(7 downto 0)
	);
end entity;

architecture rtl of mod_pio is
	
	component i8255
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
	end component;

signal fxxx					: std_logic;
signal f4xx					: std_logic;
signal fhxx					: std_logic;
signal fhxx_sel			: std_logic;
signal Ox_sel				: std_logic;
signal pm					: std_logic;
signal pmF4					: std_logic;
signal pFB					: std_logic;
signal pmF5					: std_logic;
signal p08					: std_logic;
signal p18					: std_logic;
signal cs_F4				: std_logic;
signal ctrl_o128			: std_logic;
signal z80_port_en		: std_logic;
signal p0A_wr				: std_logic;
signal z80_full_RAM		: std_logic;

signal kbd_col				: std_logic_vector(10 downto 0);
signal kbd_row				: std_logic_vector(7 downto 0);
signal kbd_mg_out			: std_logic;
signal kbd_mg_read		: std_logic_vector(3 downto 0);
signal rd_kbd_row			: std_logic;
signal wr_kbd_col0		: std_logic;
signal wr_kbd_col1		: std_logic;
signal rd_kbd_mg			: std_logic;

signal sintn_in			: std_logic;
signal stm_int_req		: std_logic;
signal stm_int_vector	: std_logic_vector(7 downto 0);

signal stm_rreg_0			: std_logic_vector(7 downto 0);
signal stm_rreg_1			: std_logic_vector(7 downto 0);
signal stm_rreg_2			: std_logic_vector(7 downto 0);
signal stm_rreg_3			: std_logic_vector(7 downto 0);
signal stm_rreg_4			: std_logic_vector(7 downto 0);
signal stm_rreg_5			: std_logic_vector(7 downto 0);
signal stm_rreg_6			: std_logic_vector(7 downto 0);
signal stm_rreg_7			: std_logic_vector(7 downto 0);

signal stm_wreg_0			: std_logic_vector(7 downto 0);
signal stm_wreg_1			: std_logic_vector(7 downto 0);
signal stm_wreg_2			: std_logic_vector(7 downto 0);
signal stm_wreg_3			: std_logic_vector(7 downto 0);
signal stm_wreg_4			: std_logic_vector(7 downto 0);
signal stm_wreg_5			: std_logic_vector(7 downto 0);
signal stm_wreg_6			: std_logic_vector(7 downto 0);
signal stm_wreg_7			: std_logic_vector(7 downto 0);

begin

-- ports decoding
fxxx <= addr(12) and addr(13) and addr(14) and addr(15) and ctrl_o128 and z80_port_en;
f4xx <= fxxx and (not addr(11)) and addr(10);
fhxx <= iorqn or (not (blion and addr(3) and addr(4) and addr(5) and addr(6)));
fhxx_sel <= addr(7) and (not (wrn)) and (not fhxx);
Ox_sel <= (blion and (not (addr(5) or addr(6)))) and (not addr(7)) and (not iorqn);
pm <= addr(11) and fxxx and (not (mreqn or wrn));
pmF4 <= f4xx and    addr(10)  and (not addr(9)) and (not addr(8));
pmF5 <= f4xx and    addr(10)  and (not addr(9)) and      addr(8);
pFB  <= fhxx_sel and      addr(0)  and      addr(1)  and (not addr(2));
p08 <= Ox_sel and (not addr(2)) and addr(3) and (not addr(4));
p18 <= Ox_sel and (not addr(2)) and addr(3) and addr(4);
cs_F4 <= p18 or pmF4;

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

-- keyboard
rd_kbd_row  <= cs_F4 and (not rdn) and (not addr(1)) and (not addr(0));
wr_kbd_col0 <= cs_F4 and (not wrn) and (not addr(1)) and      addr(0);
wr_kbd_col1 <= cs_F4 and (not wrn) and      addr(1)  and (not addr(0));
rd_kbd_mg   <= cs_F4 and (not rdn) and      addr(1)  and (not addr(0));

data <= kbd_row  when (rd_kbd_row ='1') else (others => 'Z');
data(7 downto 4) <= kbd_mg_read when (rd_kbd_mg  ='1') else (others => 'Z');

col0: process (wr_kbd_col0)
begin
	if (rising_edge(wr_kbd_col0)) then
		kbd_col(7 downto 0) <= data;
	end if;
end process;

col1: process (wr_kbd_col1)
begin
	if (rising_edge(wr_kbd_col1)) then
		kbd_col(10 downto 8) <= data(2 downto 0);
		kbd_mg_out <= data(4);
	end if;
end process;

--STM32 signals
stm_int_req <= wr_kbd_col0 or wr_kbd_col1;
sint_pr: process (resetn, srdn, stm_int_req)
begin
	if (resetn = '0') or (srdn = '1') then
		sintn_in <= '1';
		stm_int_vector <= (others => '0');
	elsif (rising_edge(stm_int_req)) then
		sintn_in <= '0';
		stm_int_vector(1 downto 0) <= addr(1 downto 0);
		stm_int_vector(2) <= '1';
	end if;
end process;
sintn <= sintn_in;

sdata <= stm_int_vector when ((srdn='1') and (swrn='1'))
	 else stm_rreg_0 when (srdn='0') and (sreg_idx="000")
	 else stm_rreg_1 when (srdn='0') and (sreg_idx="001")
	 else stm_rreg_2 when (srdn='0') and (sreg_idx="010")
	 else stm_rreg_3 when (srdn='0') and (sreg_idx="011")
	 else stm_rreg_4 when (srdn='0') and (sreg_idx="100")
	 else stm_rreg_5 when (srdn='0') and (sreg_idx="101")
	 else stm_rreg_6 when (srdn='0') and (sreg_idx="110")
	 else stm_rreg_7 when (srdn='0') and (sreg_idx="111")
	 else (others => 'Z');

stm_rreg_0 <= kbd_col(7 downto 0);
stm_rreg_1(3 downto 0) <= kbd_mg_out & kbd_col(10 downto 8);

-- fast registers
fregs: process (resetn, swrn)
begin
	if (resetn = '0') then
		stm_wreg_0 <= (others => '0');
		stm_wreg_1 <= (others => '0');
		stm_wreg_2 <= (others => '0');
		stm_wreg_3 <= (others => '0');
		stm_wreg_4 <= (others => '0');
		stm_wreg_5 <= (others => '0');
		stm_wreg_6 <= (others => '0');
		stm_wreg_7 <= (others => '0');
	elsif (rising_edge(swrn)) then
		case sreg_idx is
			when "000" =>	stm_wreg_0 <= sdata;
			when "001" =>	stm_wreg_1 <= sdata;
			when "010" =>	stm_wreg_2 <= sdata;
			when "011" =>	stm_wreg_3 <= sdata;
			when "100" =>	stm_wreg_4 <= sdata;
			when "101" =>	stm_wreg_5 <= sdata;
			when "110" =>	stm_wreg_6 <= sdata;
			when "111" =>	stm_wreg_7 <= sdata;
		end case;
	end if;
end process;

kbd_row <= stm_wreg_0;
kbd_mg_read <= stm_wreg_1(3 downto 0);

end rtl;
