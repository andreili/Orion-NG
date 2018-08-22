library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mod_cpu is
	port 
	(
		clk			:	 IN STD_LOGIC;
		clk_mem		:	 IN STD_LOGIC;
		config		:	 IN STD_LOGIC_VECTOR(7 downto 0);
		clk_sig		:	 IN STD_LOGIC;
		resetn		:	 IN STD_LOGIC;
		blion			:	 IN STD_LOGIC;
		addr			:	 OUT STD_LOGIC_VECTOR(15 downto 0);
		data			:	 INOUT STD_LOGIC_VECTOR(7 downto 0);
		iorqn			:	 OUT STD_LOGIC;
		mreqn			:	 OUT STD_LOGIC;
		rfshn			:	 OUT STD_LOGIC;
		wrn			:	 OUT STD_LOGIC;
		rdn			:	 OUT STD_LOGIC;
		m1n			:	 OUT STD_LOGIC;
		-- RAM dispatcher signal
		ram_cen_v	:	 OUT STD_LOGIC;
		ram_lbn		:	 OUT STD_LOGIC;
		ram_ubn		:	 OUT STD_LOGIC;
		ram_rdn		:	 OUT STD_LOGIC;
		ram_wrn		:	 OUT STD_LOGIC;
		ram_addr_hi	:	 OUT STD_LOGIC_VECTOR(17 downto 14);
		cs_F4			:	 OUT STD_LOGIC;
		cs_F5			:	 OUT STD_LOGIC;
		snd			:	 OUT STD_LOGIC;
		ctrl_turbo_n:	 OUT std_logic;
		pF8			:	 OUT std_logic;
		pFA			:	 OUT std_logic;
		pFB			:	 OUT std_logic;
		pFC			:	 OUT std_logic;
		ram_cen		:	 OUT std_logic_vector(3 downto 0);
		ram_buf_wr	:	 OUT std_logic;
		ram_buf_oe0	:	 OUT std_logic;
		ram_buf_oe1	:	 OUT std_logic;
		int50			:	 IN STD_LOGIC;
		irqSn			:	 IN STD_LOGIC;
		irq1n			:	 IN STD_LOGIC;
		irq2n			:	 IN STD_LOGIC;
		irq3n			:	 IN STD_LOGIC;
		irq4n			:	 IN STD_LOGIC;
		irq5n			:	 IN STD_LOGIC;
		irq6n			:	 IN STD_LOGIC;
		irq7n			:	 IN STD_LOGIC
	);
end;

architecture rtl of mod_cpu is
 
	component T80a is
		generic(
			Mode : integer := 0	-- 0 => Z80, 1 => Fast Z80, 2 => 8080, 3 => GB
		);
		port(
			RESET_n	: in std_logic;
			CLK_n		: in std_logic;
			WAIT_n	: in std_logic;
			INT_n		: in std_logic;
			NMI_n		: in std_logic;
			BUSRQ_n	: in std_logic;
			M1_n		: out std_logic;
			MREQ_n	: out std_logic;
			IORQ_n	: out std_logic;
			RD_n		: out std_logic;
			WR_n		: out std_logic;
			RFSH_n	: out std_logic;
			HALT_n	: out std_logic;
			BUSAK_n	: out std_logic;
			A			: out std_logic_vector(15 downto 0);
			D			: inout std_logic_vector(7 downto 0)
		);
	end component;

	component rom1
		PORT
		(
			address	: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
			clock		: IN STD_LOGIC;
			rden		: IN STD_LOGIC;
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;
	
	component rom2
		PORT
		(
			address	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			clock		: IN STD_LOGIC;
			rden		: IN STD_LOGIC;
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;

-- UNKNOWN
signal qrd			: std_logic;

-- signals
signal intn			: std_logic;

signal rom1_data	: std_logic_vector(7 downto 0);
signal rom2_data	: std_logic_vector(7 downto 0);

-- BUS inner
signal ZA						: std_logic_vector(15 downto 0);
signal addr_in					: std_logic_vector(15 downto 0);
signal iorqn_in				: std_logic;
signal mreqn_in				: std_logic;
signal rfshn_in				: std_logic;
signal wrn_in					: std_logic;
signal rdn_in					: std_logic;
signal m1n_in					: std_logic;

-- ports decoding
signal fxxx					: std_logic;
signal flxx					: std_logic;
signal f4xx					: std_logic;
signal f8xx					: std_logic;
signal fhxx					: std_logic;
signal fhxx_sel			: std_logic;
signal Ox_sel				: std_logic;
signal ma_sel				: std_logic;

--ports selectors
signal pm					: std_logic;
signal pmF4					: std_logic;
signal pmF5					: std_logic;
signal pmF8					: std_logic;
signal pmF9					: std_logic;
signal pmFA					: std_logic;
signal p00					: std_logic;
signal p04					: std_logic;
signal p08					: std_logic;
signal p0C					: std_logic;
signal p10					: std_logic;
signal p14					: std_logic;
signal p18					: std_logic;
signal p1C					: std_logic;
signal ppF8					: std_logic;
signal ppF9					: std_logic;
signal ppFA					: std_logic;
signal pF8_in				: std_logic;
signal pF9					: std_logic;
signal pFB_in				: std_logic;
signal pFD					: std_logic;
signal pFE					: std_logic;
signal pFF					: std_logic;

signal p08_wr				: std_logic;
signal p09_wr				: std_logic;
signal p0A_wr				: std_logic;
signal p0B_wr				: std_logic;

-- control signals
signal ctrl_rom2_addr	: std_logic_vector(7 downto 0);
signal ctrl_1C				: std_logic_vector(7 downto 0);
signal ctrl_2A				: std_logic_vector(6 downto 0);
signal ctrl_2B				: std_logic_vector(6 downto 0);
signal ctrl_2C				: std_logic_vector(6 downto 0);
signal ctrl_hi_mem		: std_logic;
signal ctrl_o128			: std_logic;
signal ctrl_intt			: std_logic;
signal ctrl_rom			: std_logic;
signal ctrl_erom			: std_logic;
signal ctrl_mb				: std_logic_vector(1 downto 0);

signal mr1					: std_logic;
signal blram				: std_logic;
signal intan				: std_logic;
signal waitn				: std_logic;
signal nmin					: std_logic;
signal haltn				: std_logic;
signal busakn				: std_logic;
signal mb					: std_logic_vector(2 downto 0);

signal rom1_sel			: std_logic;
signal rom2_sel			: std_logic;
signal ram_A16				: std_logic;
signal ram_buf_oe			: std_logic;

-- interrupts
signal dirq					: std_logic;
signal irq0res				: std_logic;
signal irq0n				: std_logic;
signal irq_vector			: std_logic_vector(2 downto 0);

-- RAM controls
signal ram_page_o128		: std_logic_vector(4 downto 0);
signal ram_page_pro		: std_logic_vector(4 downto 0);
signal ctrl_ram_addr		: std_logic_vector(4 downto 0);
signal MA_inner			: std_logic_vector(20 downto 14);
signal MA					: std_logic_vector(20 downto 14);

-- Z80-Card-II
signal z80_sector_select: std_logic_vector(1 downto 0);
signal z80_bank_select	: std_logic_vector(2 downto 0);
signal z80_full_RAM		: std_logic;
signal z80_disp_en_n		: std_logic;

signal z80_disp			: std_logic;
signal z80_port_en		: std_logic;
signal snd_in				: std_logic;
signal z80_bank			: std_logic_vector(4 downto 0);

begin

waitn <= '1';
nmin <= '1';

Z80: T80a
	port map (
		resetn,
		clk,
		waitn,
		intn,
		nmin,
		'1',
		m1n_in,
		mreqn_in,
		iorqn_in,
		rdn_in,
		wrn_in,
		rfshn_in,
		haltn,
		busakn,
		ZA,
		data
	);

r1: rom1
	port map (
		addr_in(12 downto 0),
		clk_mem,
		not rom1_sel,
		rom1_data
	);
data <= rom1_data when ((rdn_in='0') and (rom1_sel='0')) else (others => 'Z');

r2: rom2
	port map (
		ctrl_rom2_addr(2 downto 0) & addr_in(12 downto 0),
		clk_mem,
		not rom2_sel,
		rom2_data
	);
data <= rom2_data when ((rdn_in='0') and (rom2_sel='0')) else (others => 'Z');

addr <= addr_in;
iorqn <= iorqn_in;
mreqn <= mreqn_in;
rfshn <= rfshn_in;
wrn <= wrn_in;
rdn <= rdn_in;
m1n <= m1n_in;

-- ports decoding
fxxx <= addr(12) and addr(13) and ZA(14) and ZA(15) and ctrl_o128 and z80_port_en;
flxx <= (addr(10) or addr(11)) and fxxx;
f4xx <= fxxx and (not addr(11)) and addr(10);
fhxx <= iorqn or (not (blion and addr(3) and addr(4) and addr(5) and addr(6)));
fhxx_sel <= addr(7) and (not (wrn)) and (not fhxx);
Ox_sel <= (blion and (not (addr(5) or addr(6)))) and (not addr(7)) and (not iorqn);
ma_sel <= fxxx or (ctrl_hi_mem and ZA(15) and addr(14) and addr(13) and addr(12)); -- ПРОВЕРИТЬ!!!!

-- ports selectors
pm <= addr(11) and fxxx and (not (mreqn or wrn));
pmF4 <= f4xx and    addr(10)  and (not addr(9)) and (not addr(8));
pmF5 <= f4xx and    addr(10)  and (not addr(9)) and      addr(8);
pmF8 <= pm and (not addr(10)) and (not addr(9)) and (not addr(8));
pmF9 <= pm and (not addr(10)) and (not addr(9)) and      addr(8);
pmFA <= pm and (not addr(10)) and      addr(9)  and (not addr(8));
p00 <= Ox_sel and (not addr(2)) and (not addr(3)) and (not addr(4));
p04 <= Ox_sel and addr(2) and (not addr(3)) and (not addr(4));
p08 <= Ox_sel and (not addr(2)) and addr(3) and (not addr(4));
p0C <= Ox_sel and addr(2) and addr(3) and (not addr(4));
p10 <= Ox_sel and (not addr(2)) and (not addr(3)) and addr(4);
p14 <= Ox_sel and addr(2) and (not addr(3)) and addr(4);
p18 <= Ox_sel and (not addr(2)) and addr(3) and addr(4);
p1C <= Ox_sel and addr(2) and addr(3) and addr(4);
ppF8 <= fhxx_sel and (not addr(0)) and (not addr(1)) and (not addr(2));
ppF9 <= fhxx_sel and      addr(0)  and (not addr(1)) and (not addr(2));
ppFA <= fhxx_sel and (not addr(0)) and      addr(1)  and (not addr(2));
pFB_in <=  fhxx_sel and      addr(0)  and      addr(1)  and (not addr(2));
pFC <=  not (fhxx_sel and (not addr(0)) and (not addr(1)) and      addr(2));
pFD <=  fhxx_sel and      addr(0)  and (not addr(1)) and      addr(2);
pFE <=  fhxx_sel and (not addr(0)) and      addr(1)  and      addr(2);
pFF <=  fhxx_sel and      addr(0)  and      addr(1)  and      addr(2);
pF8_in <= ppF8 or pmF8;
pF9 <= ppF9 or pmF9;
pFA <= not (ppFA or pmFA);

cs_F4 <= not (p18 or pmF4);
cs_F5 <= not pmF5;
pF8 <= not pF8_in;
pFB <= pFB_in;


-- control signals
mr1 <= mreqn or (not rfshn_in);
intan <= iorqn or m1n_in;
qrd <= rdn_in and intan;
mb(0) <= not (ctrl_1C(0) and (not addr(14)) and (not ZA(15)));	-- RAM0
mb(1) <= not (ctrl_1C(1) and addr(14) and (not ZA(15)));			-- RAM1
mb(2) <= not (ctrl_1C(2) and (not addr(14)) and ZA(15));			-- RAM2
ctrl_mb(0) <= mb(0) and mb(1);
ctrl_mb(1) <= mb(0) and mb(2);
rom1_sel <= not ((not addr(14)) and (not ZA(15)) and (ctrl_erom and iorqn) and (not addr(13)));
rom2_sel <= not ((not addr(14)) and (not ZA(15)) and (iorqn and ctrl_1C(3)) and addr(13));

--Z80-Card-II
addr_in(13 downto 0) <= ZA(13 downto 0);

z80_disp <= not (z80_disp_en_n or ZA(14) or ZA(15));
addr_in(15 downto 14) <= ZA(15 downto 14) when (z80_disp='0')
	else z80_sector_select;
Z80_bank <= ram_page_o128 when (z80_disp='0')
	else "00" & z80_bank_select;

z80_port_en <= not (z80_full_RAM or (not ZA(15)));

process (pFE, pFF, data(4))
begin
	if (pFE = '1') then
		snd_in <= not data(4);
	elsif (falling_edge(pFF)) then
		snd_in <= not snd;
	end if;
end process;

snd <= snd_in;

-- port FB
FB: process (pFB_in, resetn)
begin
	if (resetn = '0') then
		z80_sector_select <= "00";
		z80_bank_select <= "000";
		z80_full_RAM <= '0';
		ctrl_intt <= '0';
		z80_disp_en_n <= '1';
		ctrl_rom <= '1';
	elsif (falling_edge(pFB_in)) then
		z80_sector_select <= data(1 downto 0);
		z80_bank_select <= data(4 downto 2);
		z80_full_RAM <= data(5);
		ctrl_intt <= data(6);
		z80_disp_en_n <= data(7);
		ctrl_rom <= '0';
	end if;
end process;
ctrl_erom <= ctrl_rom or ctrl_1C(4);

-- configuration
data <= config when ((p00 = '1') and (addr(1) = '0') and (addr(0) = '0') and (rdn_in = '0')) else (others => 'Z');

-- interrupts
process (irq0res, int50)
begin
	if (irq0res = '1') then
		irq0n <= '1';
	elsif (rising_edge(int50)) then
		irq0n <= not ctrl_intt;
	end if;
end process;

process (irq0n, intan)
begin
	if (irq0n = '1') then
		irq0res <= '0';
	elsif (rising_edge(intan)) then
		irq0res <= '1';
	end if;
end process;

irq_vector <= "000" when (irq0n = '0')
			else "001" when (irq1n = '0')
			else "010" when (irq2n = '0')
			else "011" when (irq3n = '0')
			else "100" when (irq4n = '0')
			else "101" when (irq5n = '0')
			else "110" when (irq6n = '0')
			else "111" when (irq7n = '0');
dirq <= irq0n and irq1n and irq2n and irq3n and irq4n and irq5n and irq6n and irq7n;
data <= "0000" & irq_vector & '0' when (intan='0') else (others => 'Z');
intn <= dirq and irqSn;

-- ROM2 address
p09_wr <= (not wrn_in) and P08 and (not addr(1)) and addr(0);
process (resetn, p09_wr)
begin
	if (resetn = '0') then
		ctrl_rom2_addr <= (others => '0');
	elsif (falling_edge(p09_wr)) then
		ctrl_rom2_addr <= data(7 downto 0);
	end if;
end process;
data <= ctrl_rom2_addr when ((P08 = '1') and (addr(1) = '0') and (addr(0) = '1') and (rdn_in = '0')) else (others => 'Z');

-- RAM pages (PRO mode)
memp0: process (resetn, wrn_in)
begin
	if (resetn = '0') then
		ctrl_2A <= (others => '0');
	elsif (rising_edge(wrn_in)) then
		if ((P04 = '1') and (addr(1) = '0') and (addr(0) = '0')) then
			ctrl_2A <= data(6 downto 0);
		end if;
	end if;
end process;
data <= "0" & ctrl_2A when ((P04 = '1') and (addr(1) = '0') and (addr(0) = '0') and (rdn_in = '0')) else (others => 'Z');
memp1: process (resetn, wrn_in)
begin
	if (resetn = '0') then
		ctrl_2B <= (others => '0');
	elsif (rising_edge(wrn_in)) then 
		if ((P04 = '1') and (addr(1) = '0') and (addr(0) = '1')) then
			ctrl_2B <= data(6 downto 0);
		end if;
	end if;
end process;
data <= "0" & ctrl_2B when ((P04 = '1') and (addr(1) = '0') and (addr(0) = '1') and (rdn_in = '0')) else (others => 'Z');
memp2: process (resetn, wrn_in)
begin
	if (resetn = '0') then
		ctrl_2C <= (others => '0');
	elsif (rising_edge(wrn_in)) then
		if ((P04 = '1') and (addr(1) = '1') and (addr(0) = '0')) then
			ctrl_2C <= data(6 downto 0);
		end if;
	end if;
end process;
data <= "0" & ctrl_2C when ((P04 = '1') and (addr(1) = '1') and (addr(0) = '0') and (rdn_in = '0')) else (others => 'Z');

-- RAM dispatching
blram <= not (rom1_sel and rom2_sel);
ram_wrn <= blram or mr1 or wrn_in or flxx;
ram_rdn <= blram or mr1 or rdn_in or f4xx;

mempz80: process (resetn, pF9)
begin
	if (resetn = '0') then
		ram_page_o128 <= (others => '0');
	elsif (falling_edge(pF9)) then
		ram_page_o128 <= data(4 downto 0);
	end if;
end process;

p08_wr <= (not wrn_in) and P08 and (not addr(1)) and (not addr(0));
memppro:process (resetn, p08_wr)
begin
	if (resetn = '0') then
		ram_page_pro <= (others => '0');
	elsif (falling_edge(p08_wr)) then
		ram_page_pro <= data(4 downto 0);
	end if;
end process;
data <= "111" & ram_page_pro when ((P08 = '1') and (addr(1) = '0') and (addr(0) = '0') and (rdn_in = '0')) else (others => 'Z');

--ctrl_ram_addr <= ram_page_o128(4 downto 2) & Z80_bank when (ctrl_o128 = '1') 
ctrl_ram_addr <= Z80_bank when (ctrl_o128 = '1') 
	else ram_page_pro;

MA_inner(14) <= ctrl_2A(0) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='0'))
			  else ctrl_2B(0) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='1'))
			  else ctrl_2C(0) when ((ctrl_mb(0)='1') and (ctrl_mb(1)='0'))
			  else addr(14);
MA_inner(15) <= ctrl_2A(1) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='0'))
			  else ctrl_2B(1) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='1'))
			  else ctrl_2C(1) when ((ctrl_mb(0)='1') and (ctrl_mb(1)='0'))
			  else addr(15);
MA_inner(16) <= ctrl_2A(2) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='0'))
			  else ctrl_2B(2) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='1'))
			  else ctrl_2C(2) when ((ctrl_mb(0)='1') and (ctrl_mb(1)='0'))
			  else ctrl_ram_addr(0);
MA_inner(17) <= ctrl_2A(3) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='0'))
			  else ctrl_2B(3) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='1'))
			  else ctrl_2C(3) when ((ctrl_mb(0)='1') and (ctrl_mb(1)='0'))
			  else ctrl_ram_addr(1);
MA_inner(18) <= ctrl_2A(4) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='0'))
			  else ctrl_2B(4) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='1'))
			  else ctrl_2C(4) when ((ctrl_mb(0)='1') and (ctrl_mb(1)='0'))
			  else ctrl_ram_addr(2);
MA_inner(19) <= ctrl_2A(5) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='0'))
			  else ctrl_2B(5) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='1'))
			  else ctrl_2C(5) when ((ctrl_mb(0)='1') and (ctrl_mb(1)='0'))
			  else ctrl_ram_addr(3);
MA_inner(20) <= ctrl_2A(6) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='0'))
			  else ctrl_2B(6) when ((ctrl_mb(0)='0') and (ctrl_mb(1)='1'))
			  else ctrl_2C(6) when ((ctrl_mb(0)='1') and (ctrl_mb(1)='0'))
			  else ctrl_ram_addr(4);
MA(15 downto 14) <= MA_inner(15 downto 14);
MA(17 downto 16) <= MA_inner(18 downto 17) when (ma_sel = '0') else (others => '0');
ram_A16 <= MA_inner(16) when (ma_sel = '0') else '0';

ram_lbn <= ram_A16;
ram_ubn <= not ram_A16;

ram_addr_hi <= MA(17 downto 14);

ram_cen_v <= MA_inner(20) or MA_inner(19) or MA_inner(18) or MA_inner(17);

ram_cen(0) <= MA_inner(20) or MA_inner(19) or (not MA_inner(18));
ram_cen(1) <= MA_inner(20) or (not MA_inner(19));
ram_cen(2) <= (not MA_inner(20)) or MA_inner(19);
ram_cen(3) <= MA_inner(20) nand MA_inner(19);

ram_buf_wr <= wrn_in;
ram_buf_oe <= blram or mr1 or (wrn_in and rdn_in) or (not (MA_inner(18) or MA_inner(17)));
ram_buf_oe0 <= ram_buf_oe or ram_A16;
ram_buf_oe1 <= ram_buf_oe or (not ram_A16);

-- memory controls
p0A_wr <= (not wrn_in) and P08 and addr(1) and (not addr(0));
process (resetn, p0A_wr)
begin
	if (resetn = '0') then
		ctrl_1C <= (others => '0');
	elsif (falling_edge(p0A_wr)) then
		ctrl_1C <= data;
	end if;
end process;
data <= ctrl_1C when ((P08 = '1') and (addr(1) = '1') and (addr(0) = '0') and (rdn_in = '0')) else (others => 'Z');

ctrl_hi_mem <= ctrl_1C(6);
ctrl_o128 <= ctrl_1C(7);

end rtl;
