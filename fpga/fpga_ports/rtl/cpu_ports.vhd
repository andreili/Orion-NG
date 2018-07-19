library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cpu_ports is
	port (
		clk			:	 IN STD_LOGIC;
		data			:	 INOUT STD_LOGIC_VECTOR(7 downto 0);
		addr			:	 IN STD_LOGIC_VECTOR(15 downto 0);
		m1n			:	 IN STD_LOGIC;
		iorqn			:	 IN STD_LOGIC;
		mreqn			:	 IN STD_LOGIC;
		rdn			:	 IN STD_LOGIC;
		wrn			:	 IN STD_LOGIC;
		rfshn			:	 IN STD_LOGIC;
		resetn		:	 IN STD_LOGIC;

		qrd			:	 OUT STD_LOGIC;
		intn			:	 OUT STD_LOGIC;
		MA				:	 OUT STD_LOGIC_VECTOR(19 downto 14);
		rom1_sel		:	 OUT STD_LOGIC;
		rom2_sel		:	 OUT STD_LOGIC;
		ctrl_turbo_n:	 OUT STD_LOGIC;
		rom2_addr	:	 OUT STD_LOGIC_VECTOR(2 downto 0);

		blion			:	 IN STD_LOGIC;
		int50Hz		:	 IN STD_LOGIC;
		config		:	 IN STD_LOGIC_VECTOR(7 downto 0);
		irqSn			:	 IN STD_LOGIC;
		irq1n			:	 IN STD_LOGIC;
		irq2n			:	 IN STD_LOGIC;
		irq3n			:	 IN STD_LOGIC;
		irq4n			:	 IN STD_LOGIC;
		irq5n			:	 IN STD_LOGIC;
		irq6n			:	 IN STD_LOGIC;
		irq7n			:	 IN STD_LOGIC
	);
end entity;

architecture rtl of cpu_ports is

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
signal pFB					: std_logic;
signal pFD					: std_logic;
signal pFE					: std_logic;
signal pFF					: std_logic;
signal pF9					: std_logic;

-- control signals
signal ctrl_rom2_addr	: std_logic_vector(2 downto 0);
signal ctrl_1C				: std_logic_vector(7 downto 0);
signal ctrl_2A				: std_logic_vector(5 downto 0);
signal ctrl_2B				: std_logic_vector(5 downto 0);
signal ctrl_2C				: std_logic_vector(5 downto 0);
signal ctrl_o128			: std_logic;
signal ctrl_intt			: std_logic;
signal ctrl_rom			: std_logic;
signal ctrl_erom			: std_logic;
signal ctrl_mb				: std_logic_vector(1 downto 0);

signal mr1					: std_logic;
signal intan				: std_logic;
signal mb					: std_logic_vector(2 downto 0);

-- interrupts
signal dirq					: std_logic;
signal irq0res				: std_logic;
signal irq0n				: std_logic;
signal irq_vector			: std_logic_vector(2 downto 0);

-- RAM controls
signal ram_page_z80		: std_logic_vector(3 downto 0);
signal ram_page_pro		: std_logic_vector(3 downto 0);
signal ctrl_ram_addr		: std_logic_vector(3 downto 0);
signal MA_inner			: std_logic_vector(19 downto 14);

begin

-- ports decoding
fxxx <= not (addr(12) and addr(13) and addr(14) and addr(15) and ctrl_o128);
flxx <= (not (addr(10) or addr(11))) or fxxx;
f4xx <= flxx or addr(11);
f8xx <= not (addr(11) and (not fxxx));
fhxx <= iorqn or (not (blion and addr(3) and addr(4) and addr(5) and addr(6)));
fhxx_sel <= addr(7) and (not (wrn)) and (not fhxx);
Ox_sel <= (blion and (not (addr(5) or addr(6)))) and (not addr(7)) and (not iorqn);
ma_sel <= fxxx and (not (ctrl_1C(6) and addr(15) and addr(14) and addr(13) and addr(12)));

-- ports selectors
pm <= addr(11) and addr(12) and addr(13) and addr(14) and addr(15) and (not (mreqn or wrn));
pmF9 <= pm and (not addr(10)) and (not addr(9)) and      addr(8);
p00 <= Ox_sel and (not addr(2)) and (not addr(3)) and (not addr(4));
p04 <= Ox_sel and addr(2) and (not addr(3)) and (not addr(4));
p08 <= Ox_sel and (not addr(2)) and addr(3) and (not addr(4));
p0C <= Ox_sel and addr(2) and addr(3) and (not addr(4));
p10 <= Ox_sel and (not addr(2)) and (not addr(3)) and addr(4);
p14 <= Ox_sel and addr(2) and (not addr(3)) and addr(4);
p18 <= Ox_sel and (not addr(2)) and addr(3) and addr(4);
p1C <= Ox_sel and addr(2) and addr(3) and addr(4);
ppF9 <= fhxx_sel and addr(0) and (not addr(1)) and (not addr(2));
pFB <=  fhxx_sel and addr(0) and addr(1) and (not addr(2));
pFD <=  fhxx_sel and addr(0) and (not addr(1)) and addr(2);
pFE <=  fhxx_sel and (not addr(0)) and addr(1) and addr(2);
pFF <=  fhxx_sel and addr(0) and addr(1) and addr(2);
pF9 <= ppF9 or pmF9;

-- control signals
mr1 <= mreqn or (not rfshn);
intan <= iorqn or m1n;
qrd <= rdn and intan;
mb(0) <= not (ctrl_1C(0) and (not addr(14)) and (not addr(15)));	-- RAM0
mb(1) <= not (ctrl_1C(1) and addr(14) and (not addr(15)));			-- RAM1
mb(2) <= not (ctrl_1C(2) and (not addr(14)) and addr(15));			-- RAM2
ctrl_mb(0) <= mb(0) and mb(1);
ctrl_mb(1) <= mb(0) and mb(2);
rom1_sel <= not ((not addr(14)) and (not addr(15)) and (ctrl_erom and iorqn) and (not addr(13)));
rom2_sel <= not ((not addr(14)) and (not addr(15)) and (iorqn and ctrl_1C(3)) and addr(13));

-- port FB
FB: process (pFB, resetn)
begin
	if (resetn = '0') then
		ctrl_intt <= '0';
		ctrl_rom <= '1';
	elsif (rising_edge(pFB)) then
		ctrl_intt <= data(6);
		ctrl_rom <= '0';
	end if;
end process;
ctrl_erom <= ctrl_rom or ctrl_1C(4);

-- configuration
data <= config when ((p00 = '1') and (addr(1) = '0') and (addr(0) = '0') and (rdn = '0')) else (others => 'Z');

-- interrupts
process (irq0res, int50Hz)
begin
	if (irq0res = '1') then
		irq0n <= '1';
	elsif (rising_edge(int50Hz)) then
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
process (resetn, wrn)
begin
	if (resetn = '0') then
		ctrl_rom2_addr <= (others => '0');
	elsif (rising_edge(wrn)) then
		if ((P08 = '1') and (addr(1) = '0') and (addr(0) = '1')) then
			ctrl_rom2_addr <= data(2 downto 0);
		end if;
	end if;
end process;
data <= "00000" & ctrl_rom2_addr when ((P08 = '1') and (addr(1) = '0') and (addr(0) = '1') and (rdn = '0')) else (others => 'Z');

-- RAM pages (PRO mode)
memp0: process (resetn, wrn)
begin
	if (resetn = '0') then
		ctrl_2A <= (others => '0');
	elsif (rising_edge(wrn)) then
		if ((P04 = '1') and (addr(1) = '0') and (addr(0) = '0')) then
			ctrl_2A <= data(5 downto 0);
		end if;
	end if;
end process;
data <= "00" & ctrl_2A when ((P04 = '1') and (addr(1) = '0') and (addr(0) = '0') and (rdn = '0')) else (others => 'Z');
memp1: process (resetn, wrn)
begin
	if (resetn = '0') then
		ctrl_2B <= (others => '0');
	elsif (rising_edge(wrn)) then 
		if ((P04 = '1') and (addr(1) = '0') and (addr(0) = '1')) then
			ctrl_2B <= data(5 downto 0);
		end if;
	end if;
end process;
data <= "00" & ctrl_2B when ((P04 = '1') and (addr(1) = '0') and (addr(0) = '1') and (rdn = '0')) else (others => 'Z');
memp2: process (resetn, wrn)
begin
	if (resetn = '0') then
		ctrl_2C <= (others => '0');
	elsif (rising_edge(wrn)) then
		if ((P04 = '1') and (addr(1) = '1') and (addr(0) = '0')) then
			ctrl_2C <= data(5 downto 0);
		end if;
	end if;
end process;
data <= "00" & ctrl_2C when ((P04 = '1') and (addr(1) = '1') and (addr(0) = '0') and (rdn = '0')) else (others => 'Z');

-- RAM dispatching
mempz80: process (resetn, pF9)
begin
	if (resetn = '0') then
		ram_page_z80 <= (others => '0');
	elsif (rising_edge(pF9)) then
		ram_page_z80 <= data(3 downto 0);
	end if;
end process;

memppro:process (resetn, wrn)
begin
	if (resetn = '0') then
		ram_page_pro <= (others => '0');
	elsif (rising_edge(wrn)) then
		if ((P08 = '1') and (addr(1) = '0') and (addr(0) = '0')) then
			ram_page_pro <= data(3 downto 0);
		end if;
	end if;
end process;
data <= "1111" & ram_page_pro when ((P08 = '1') and (addr(1) = '0') and (addr(0) = '0') and (rdn = '0')) else (others => 'Z');

ctrl_ram_addr <= ram_page_z80 when (ctrl_o128 = '1') else ram_page_pro;

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
MA(15 downto 14) <= MA_inner(15 downto 14);
MA(19 downto 16) <= MA_inner(19 downto 16) when (ma_sel = '1') else (others => '1');

-- memory controls
process (resetn, wrn)
begin
	if (resetn = '0') then
		ctrl_1C <= (others => '0');
	elsif (rising_edge(wrn)) then
		if ((P08 = '1') and (addr(1) = '1') and (addr(0) = '0')) then
			ctrl_1C <= data;
		end if;
	end if;
end process;
data <= ctrl_1C when ((P08 = '1') and (addr(1) = '1') and (addr(0) = '0') and (rdn = '0')) else (others => 'Z');

ctrl_turbo_n <= ctrl_1C(5);
ctrl_o128 <= ctrl_1C(7);
rom2_addr <= ctrl_rom2_addr;

end rtl;
