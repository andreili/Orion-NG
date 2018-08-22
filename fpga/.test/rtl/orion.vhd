-- altera vhdl_input_version vhdl_2008

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity orion is
	port (
		CLOCK_50		: in  std_logic;
		
		SW				: in std_logic_vector(9 downto 0);
		KEY			: in std_logic_vector(3 downto 0);
		
		LEDR			: out std_logic_vector(9 downto 0);
		
		ZA				: out std_logic_vector(15 downto 0);
		
		SMA			: out std_logic_vector(17 downto 0);
		SMD			: inout std_logic_vector(15 downto 0);
		SOE			: out std_logic;
		SUB			: out std_logic;
		SLB			: out std_logic;
		SCE			: out std_logic;
		SWE			: out std_logic;
		
		HEX0			: out std_logic_vector(6 downto 0);
		HEX1			: out std_logic_vector(6 downto 0);
		HEX2			: out std_logic_vector(6 downto 0);
		HEX3			: out std_logic_vector(6 downto 0);
		HEX4			: out std_logic_vector(6 downto 0);
		HEX5			: out std_logic_vector(6 downto 0);

		PS2_CLK		: in  std_logic;
		PS2_DAT		: in  std_logic;

		VGA_R			: out std_logic_vector(7 downto 0);
		VGA_G			: out std_logic_vector(7 downto 0);
		VGA_B			: out std_logic_vector(7 downto 0);
		VGA_BLANK_N	: out std_logic;
		VGA_CLK		: out std_logic;
		VGA_HS		: out std_logic;
		VGA_SYNC_N	: out std_logic;
		VGA_VS		: out std_logic
	);
end entity;

architecture rtl of orion is

	component orion_pll is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic;        -- clk 25MHz
			outclk_1 : out std_logic         -- clk 100MHz
		);
	end component;

	component debounce
		generic (
			WIDTH : INTEGER := 4;
			POLARITY : STRING := "HIGH";
			TIMEOUT : INTEGER := 500000;
			TIMEOUT_WIDTH : INTEGER := 20
		);
		port
		(
			clk		:	in std_logic;
			reset_n	:	in std_logic;
			data_in	:	in std_logic_vector(WIDTH-1 downto 0);
			data_out	:	out std_logic_vector(WIDTH-1 downto 0)
		);
	end component;

	component mod_video is
		port 
		(
			clk			:	 IN STD_LOGIC;
			clk_mem		:	 IN STD_LOGIC;
			-- configuration
			wide_en		:	 IN STD_LOGIC;
			clk_sel		:	 IN STD_LOGIC;
			-- to CPU
			clk_sig		:	 OUT STD_LOGIC;
			--from CPU
			resetn		:	 IN STD_LOGIC;
			addr			:	 IN STD_LOGIC_VECTOR(15 downto 0);
			data			:	 INOUT STD_LOGIC_VECTOR(7 downto 0);
			iorqn			:	 IN STD_LOGIC;
			mreqn			:	 IN STD_LOGIC;
			wrn			:	 IN STD_LOGIC;
			blion			:	 IN STD_LOGIC;
			ctrl_turbo_n:	 IN std_logic;
			pF8			:	 IN std_logic;
			pFA			:	 IN std_logic;
			pFB			:	 IN std_logic;
			pFC			:	 IN std_logic;
			-- RAM dispatcher signal
			ram_cen_v	:	 IN STD_LOGIC;
			ram_lbn		:	 IN STD_LOGIC;
			ram_ubn		:	 IN STD_LOGIC;
			ram_rdn		:	 IN STD_LOGIC;
			ram_wrn		:	 IN STD_LOGIC;
			ram_addr_hi	:	 IN STD_LOGIC_VECTOR(15 downto 14);
			-- to video
			HS				:	 OUT STD_LOGIC;
			VS				:	 OUT STD_LOGIC;
			R				:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			G				:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			B				:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			int50			:	 OUT STD_LOGIC
		);
	end component;

	component mod_cpu is
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
	end component;

	component orion_pio is
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
	end component;

signal clk_50MHz			: std_logic;	-- сигнал с генератора, только для PLL!!!
signal clk_25MHz			: std_logic;
signal clk_100MHz			: std_logic;
signal KEY_debounced		: std_logic_vector(3 downto 0);

signal wide_enable		: std_logic;

signal R		: std_logic_vector(1 downto 0);
signal G		: std_logic_vector(1 downto 0);
signal B		: std_logic_vector(1 downto 0);

-- BUS
signal clk_sig				: std_logic;
signal resetn				: std_logic;
signal addr					: std_logic_vector(15 downto 0);
signal data					: std_logic_vector( 7 downto 0);
signal iorqn				: std_logic;
signal mreqn				: std_logic;
signal rfshn				: std_logic;
signal wrn					: std_logic;
signal rdn					: std_logic;
signal m1n					: std_logic;
signal blion				: std_logic;
signal ram_cen_v			: std_logic;
signal ram_lbn				: std_logic;
signal ram_ubn				: std_logic;
signal ram_rdn				: std_logic;
signal ram_wrn				: std_logic;
signal MA					: std_logic_vector(17 downto 14);
signal int50Hz				: std_logic;
signal irqSn				: std_logic;
signal irq1n				: std_logic;
signal irq2n				: std_logic;
signal irq3n				: std_logic;
signal irq4n				: std_logic;
signal irq5n				: std_logic;
signal irq6n				: std_logic;
signal irq7n				: std_logic;

signal cs_F4				: std_logic;
signal cs_F5				: std_logic;
signal snd					: std_logic;
signal pF8					: std_logic;
signal pFA					: std_logic;
signal pFB					: std_logic;
signal pFC					: std_logic;
signal ctrl_turbo_n		: std_logic;

signal ram_cen				: std_logic_vector(3 downto 0);
signal ram_buf_wr			: std_logic;
signal ram_buf_oe0		: std_logic;
signal ram_buf_oe1		: std_logic;

begin
--------------------------------------------------------------------------------
--                       СВЯЗЬ СИГНАЛОВ С ПИНАМИ МС                           --
--------------------------------------------------------------------------------
clk_50MHz <= CLOCK_50;
LEDR(0) <= data(0);
LEDR(1) <= data(1);
LEDR(2) <= data(2);
LEDR(3) <= data(3);
LEDR(4) <= data(4);
LEDR(5) <= data(5);
LEDR(6) <= data(6);
LEDR(7) <= data(7);
LEDR(8) <= resetn;
LEDR(9) <= '0';
HEX0 <= (others => '1');
HEX1 <= (others => '1');
HEX2 <= (others => '1');
HEX3 <= (others => '1');
HEX4 <= (others => '1');
HEX5 <= (others => '1');

wide_enable <= SW(9);
resetn <= KEY_debounced(0);

--------------------------------------------------------------------------------
--                      ПОДКЛЮЧЕНИЕ ВНЕШНИХ МОДУЛЕЙ                           --
--------------------------------------------------------------------------------
-- основной PLL
pll_orion: orion_pll
	port map (
		clk_50MHz,
		'0',
		clk_25MHz,
		clk_100MHz
	);

deb: debounce
	port map (
		clk_100MHz,
		'1',
		KEY,
		KEY_debounced
	);

--------------------------------------------------------------------------------
--                            ВИДЕО И ПАМЯТЬ                                  --
--------------------------------------------------------------------------------

video: mod_video
	port map (
		clk_25MHz,
		clk_100MHz,
		wide_enable,
		SW(8),
		clk_sig,
		resetn,
		addr,
		data,
		iorqn,
		mreqn,
		wrn,
		blion,
		ctrl_turbo_n,
		pF8,
		pFA,
		pFB,
		pFC,
		ram_cen_v,
		ram_lbn,
		ram_ubn,
		ram_rdn,
		ram_wrn,
		MA(15 downto 14),
		VGA_HS,
		VGA_VS,
		R,
		G,
		B,
		int50Hz
	);

cpu: mod_cpu
	port map (
		clk_25MHz,
		clk_100MHz,
		SW(7 downto 0),
		clk_sig,
		resetn,
		blion,
		addr,
		data,
		iorqn,
		mreqn,
		rfshn,
		wrn,
		rdn,
		m1n,
		ram_cen_v,
		ram_lbn,
		ram_ubn,
		ram_rdn,
		ram_wrn,
		MA,
		cs_F4,
		cs_F5,
		snd,
		ctrl_turbo_n,
		pF8,
		pFA,
		pFB,
		pFC,
		ram_cen,
		ram_buf_wr,
		ram_buf_oe0,
		ram_buf_oe1,
		int50Hz,
		irqSn,
		irq1n,
		irq2n,
		irq3n,
		irq4n,
		irq5n,
		irq6n,
		irq7n
	);

pio : orion_pio
	port map (
		clk_100MHz,
		resetn,
		addr,
		data,
		rdn,
		wrn,
		cs_F5 & cs_F4,
		PS2_CLK,
		PS2_DAT
	);

VGA_R(7) <= R(0);
VGA_G(7) <= G(0);
VGA_B(7) <= B(0);
VGA_R(6) <= R(1);
VGA_G(6) <= G(1);
VGA_B(6) <= B(1);
VGA_R(5 downto 0) <= (others => R(0));
VGA_G(5 downto 0) <= (others => G(0));
VGA_B(5 downto 0) <= (others => B(0));
VGA_CLK <= clk_50MHz;
VGA_SYNC_N <= '0';
VGA_BLANK_N <= '1';

ZA <= addr;

SMA <= MA & addr(13 downto 0);
SOE <= ram_rdn;
SUB <= ram_ubn;
SLB <= ram_lbn;
SCE <= ram_cen(0);
SWE <= ram_wrn;

SMD(7  downto 0) <= data when ((ram_buf_wr='0') and (ram_buf_oe0='0')) else (others => 'Z');
SMD(15 downto 8) <= data when ((ram_buf_wr='0') and (ram_buf_oe1='0')) else (others => 'Z');
data <= SMD(7  downto 0) when ((ram_buf_wr='1') and (ram_buf_oe0='0')) else (others => 'Z');
data <= SMD(15 downto 8) when ((ram_buf_wr='1') and (ram_buf_oe1='0')) else (others => 'Z');

blion <= '1';
irqSn <= '1';
irq1n <= '1';
irq2n <= '1';
irq3n <= '1';
irq4n <= '1';
irq5n <= '1';
irq6n <= '1';
irq7n <= '1';

end rtl;
