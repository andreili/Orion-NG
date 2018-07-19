library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity video_ports is
	port (
		resetn		:	 IN STD_LOGIC;
		data			:	 IN STD_LOGIC_VECTOR(7 downto 0);
		addr			:	 IN STD_LOGIC_VECTOR(15 downto 0);
		wrn			:	 IN STD_LOGIC;
		rdn			:	 IN STD_LOGIC;
		iorqn			:	 IN STD_LOGIC;
		mreqn			:	 IN STD_LOGIC;
		rfshn			:	 IN STD_LOGIC;

		blion			:	 IN STD_LOGIC;

		pF8			:	 OUT STD_LOGIC;
		pFC			:	 OUT STD_LOGIC;

		video_mode4	:	 OUT STD_LOGIC;
		SR16			:	 OUT STD_LOGIC;
		video_bank	:	 OUT STD_LOGIC_VECTOR(1 downto 0);
		ctrl_turbo_n:	 OUT STD_LOGIC;
		mem_wrn		:	 OUT STD_LOGIC;
		mem_rdn		:	 OUT STD_LOGIC
	);
end entity;

architecture rtl of video_ports is

signal fxxx					: std_logic;
signal flxx					: std_logic;
signal f4xx					: std_logic;
signal pwr					: std_logic;
signal pm					: std_logic;
signal Ox_sel				: std_logic;

-- orion memory ports
signal pmF8					: std_logic;
signal pmFA					: std_logic;
--orion Z80 ports
signal ppF8					: std_logic;
signal ppFA					: std_logic;

signal p04					: std_logic;
signal p08					: std_logic;
signal pF8_inner			: std_logic;
signal pFA					: std_logic;
signal pFB					: std_logic;

signal mr1					: std_logic;
signal blram				: std_logic;

signal ctrl_o128			: std_logic;
signal ctrl_ROM1_EN		: std_logic;
signal ctrl_ROM2_EN		: std_logic;
signal ctrl_rom			: std_logic;
signal ctrl_erom			: std_logic;

signal rom1_sel			: std_logic;
signal rom2_sel			: std_logic;

begin

-- ports decoding
fxxx <= addr(12) and addr(13) and addr(14) and addr(15) and ctrl_o128;
flxx <= (addr(10) or addr(11)) and fxxx;
f4xx <= flxx or addr(11);
pwr <= addr(7) and addr(6) and addr(5) and addr(4) and addr(3) and blion and (not (iorqn or wrn));
Ox_sel <= blion and (not addr(5)) and (not addr(6)) and (not addr(7)) and (not iorqn);

-- ports selectors
pm <= fxxx and addr(11) and (not (mreqn or wrn));	-- A15-A8 = 0xF8-0xFF
pmF8 <= pm and (not addr(10)) and (not addr(9)) and (not addr(8));
pmFA <= pm and (not addr(10)) and addr(9) and (not addr(8));

ppF8 <= pwr and (not addr(0)) and (not addr(1)) and (not addr(2));
ppFA <= pwr and (not addr(0)) and addr(1) and (not addr(2));
pFB  <= pwr and addr(0) and addr(1) and (not addr(2));
pFC  <= pwr and (not addr(0)) and (not addr(1)) and addr(2);

pF8_inner <= ppF8 or pmF8;
pFA <= ppFA or pmFA;

pF8 <= pF8_inner;

p08 <= Ox_sel and (not addr(2)) and addr(3) and (not addr(4));

mr1 <= mreqn or (not rfshn);

-- port F8
F8: process (pF8_inner, resetn)
begin
	if (resetn = '0') then
		video_mode4 <= '0';
	elsif (rising_edge(pF8_inner)) then
		video_mode4 <= data(4);
	end if;
end process;

-- port FB
FB: process (pFB, resetn)
begin
	if (resetn = '0') then
		ctrl_rom <= '1';
	elsif (rising_edge(pFB)) then
		ctrl_rom <= '0';
	end if;
end process;
ctrl_erom <= ctrl_rom or ctrl_ROM1_EN;

-- port FA
process (resetn, pFA)
begin
	if (resetn = '0') then
		video_bank <= "00";
		SR16 <= '0';
	elsif (rising_edge(pFA)) then
		video_bank <= data(1) & data(0);
		SR16 <= data(7);
	end if;
end process;

-- RAM blocking
rom1_sel <= not ((not addr(14)) and (not addr(15)) and (ctrl_erom and iorqn) and (not addr(13)));
rom2_sel <= not ((not addr(14)) and (not addr(15)) and (iorqn and ctrl_ROM2_EN) and addr(13));
blram <= not (rom1_sel and rom2_sel);

mem_wrn <= blram or mr1 or wrn or flxx;
mem_rdn <= blram or mr1 or rdn or f4xx;

-- memory controls
process (resetn, wrn)
begin
	if (resetn = '0') then
		ctrl_ROM2_EN <= '0';
		ctrl_ROM1_EN <= '0';
		ctrl_turbo_n <= '0';
		ctrl_o128 <= '0';
	elsif (rising_edge(wrn)) then
		if ((P08 = '1') and (addr(1) = '1') and (addr(0) = '0')) then
			ctrl_ROM2_EN <= data(3);
			ctrl_ROM1_EN <= data(4);
			ctrl_turbo_n <= data(5);
			ctrl_o128 <= data(7);
		end if;
	end if;
end process;

end rtl;
