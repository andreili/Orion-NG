-- altera vhdl_input_version vhdl_2008

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity orion_pio is
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
		ps2_clk		: in  std_logic;
		ps2_data		: in  std_logic
	);
end entity;

architecture rtl of orion_pio is

	component rom_disk
		port
		(
			address	: in  std_logic_vector(15 downto 0);
			clock		: in  std_logic;
			rden		: in  std_logic;
			q			: out std_logic_vector(7 downto 0)
		);
	end component;
	
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

signal rom_addr	: std_logic_vector(15 downto 0);
signal rom_data	: std_logic_vector( 7 downto 0);
signal rom_data1	: std_logic_vector( 7 downto 0);

	component orionkeyboard
		port
		(
			clk			: in  std_logic;
			reset			: in  std_logic;
			res_k			: out std_logic;
			turb_10		: out std_logic;
			turb_5		: out std_logic;
			turb_2		: out std_logic;
			rom_s			: out std_logic;
			cpm_s			: out std_logic;
			ps2_clk		: in  std_logic;
			ps2_data		: in  std_logic;
			rk_kb_scan	: in  std_logic_vector(7 downto 0);
			rk_kb_out	: out std_logic_vector(7 downto 0);
			pref			: out std_logic_vector(1 downto 0);
			key_rus_lat	: out std_logic;
			key_us		: out std_logic;
			key_ss		: out std_logic;
			ind_rus_lat	: in  std_logic;
			rk_kbo		: out std_logic_vector(7 downto 0);
			key_int		: out std_logic;
			ask_int		: in  std_logic
		);
	end component;

signal kb_scan				: std_logic_vector(7 downto 0);
signal kb_out				: std_logic_vector(7 downto 0);
signal kb_out1				: std_logic_vector(7 downto 0);
signal kb_out_ex			: std_logic_vector(7 downto 0);
signal turbo_2				: std_logic;							-- unused
signal turbo_5				: std_logic;							-- unused
signal turbo_10			: std_logic;							-- unused
signal rom_s				: std_logic;							-- unused
signal cpm_s				: std_logic;							-- unused
signal prefix				: std_logic_vector(1 downto 0);	-- unused
signal scan_key			: std_logic_vector(7 downto 0);	-- unused
signal int_key				: std_logic;							-- unused
signal reset_btn			: std_logic;

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
cs_F4 <= not (p18 or pmF4);

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

/*disk: rom_disk
	port map (
		rom_addr,
		clk,
		'1',
		rom_data
	);
rom_data1 <= rom_data when (rdn='0') else (others => 'Z');*/

port_1: i8255
	port map (
		clk,
		data,
		addr(1 downto 0),
		rdn,
		wrn,
		not pmF5,
		not resetn,
		rom_data1,
		rom_addr( 7 downto 0),
		rom_addr(15 downto 8)
	);

kbd: orionkeyboard
	port map (
		clk,
		not resetn,
		reset_btn,
		turbo_10,
		turbo_5,
		turbo_2,
		rom_s,
		cpm_s,
		ps2_clk,
		ps2_data,
		kb_scan,
		kb_out,
		prefix,
		kb_out_ex(7),
		kb_out_ex(6),
		kb_out_ex(5),
		'0',
		scan_key,
		int_key,
		'0'
	);

kb_out_ex(4 downto 0) <= "10000" when (resetn='1') else (others => 'Z');
kb_out1 <= kb_out when (resetn='1') else (others => 'Z');
port_0: i8255
	port map (
		clk,
		data,
		addr(1 downto 0),
		rdn,
		wrn,
		cs_F4,
		not resetn,
		kb_scan,
		kb_out1,
		kb_out_ex
	);

end rtl;
