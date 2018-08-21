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
		ports_cs		: in  std_logic_vector(1 downto 0);
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

begin

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
		ports_cs(1),
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
		ports_cs(0),
		not resetn,
		kb_scan,
		kb_out1,
		kb_out_ex
	);

end rtl;
