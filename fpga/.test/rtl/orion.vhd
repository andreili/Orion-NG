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
		
		/*ZA				: in std_logic_vector(15 downto 0);
		ZD				: inout std_logic_vector(7 downto 0);
		ZRES			: out std_logic;
		ZCLK			: out std_logic;
		ZINT			: out std_logic;
		ZMREQ			: in  std_logic;
		ZRFSH			: in  std_logic;
		ZM1			: in  std_logic;
		ZIORQ			: in  std_logic;
		ZWR			: in  std_logic;
		ZRD			: in  std_logic;*/
		
		SMA			: out std_logic_vector(17 downto 0);
		SMD			: inout std_logic_vector(15 downto 0);
		SOE			: out std_logic;
		SUB			: out std_logic;
		SLB			: out std_logic;
		SCE			: out std_logic;
		SWE			: out std_logic;
		
		PS2_CLK		: inout  std_logic;
		PS2_DAT		: inout  std_logic;
		
		HEX0			: out std_logic_vector(6 downto 0);
		HEX1			: out std_logic_vector(6 downto 0);
		HEX2			: out std_logic_vector(6 downto 0);
		HEX3			: out std_logic_vector(6 downto 0);
		HEX4			: out std_logic_vector(6 downto 0);
		HEX5			: out std_logic_vector(6 downto 0);

		/*DRAM_ADDR	: out std_logic_vector(12 downto 0);
		DRAM_BA		: out std_logic_vector(1 downto 0);
		DRAM_CAS_N	: out std_logic;
		DRAM_CKE		: out std_logic;
		DRAM_CLK		: out std_logic;
		DRAM_CS_N	: out std_logic;
		DRAM_DQ		: inout std_logic_vector(15 downto 0);
		DRAM_LDQM	: out std_logic;
		DRAM_RAS_N	: out std_logic;
		DRAM_UDQM	: out std_logic;
		DRAM_WE_N	: out std_logic;*/

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
			outclk_1 : out std_logic;        -- clk 100MHz
			outclk_2 : out std_logic         -- clk 100MHz
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

	component vmem is
		port 
		(
			clk_25		:	 IN STD_LOGIC;
			clk_shifted	:	 IN STD_LOGIC;
			-- controls
			wide_en		:	 IN STD_LOGIC;
			clk_sel		:	 IN STD_LOGIC;
			-- to CPU
			clk_sig		:	 OUT STD_LOGIC;
			-- from CPU
			resetn		:	 IN STD_LOGIC;
			addr			:	 IN STD_LOGIC_VECTOR(15 downto 0);
			data01		:	 IN STD_LOGIC_VECTOR(1 downto 0);
			data35		:	 IN STD_LOGIC_VECTOR(5 downto 3);
			data7			:	 IN STD_LOGIC;
			iorqn			:	 IN STD_LOGIC;
			mreqn			:	 IN STD_LOGIC;
			wrn			:	 IN STD_LOGIC;
			rdn			:	 IN STD_LOGIC;
			rfshn			:	 IN STD_LOGIC;
			blion			:	 IN STD_LOGIC;
			VA				:	 IN STD_LOGIC_VECTOR(20 downto 14);
			-- to video
			pF8			:	 OUT STD_LOGIC;
			pFC			:	 OUT STD_LOGIC;
			BEn			:	 OUT STD_LOGIC;
			blank_n		:	 OUT STD_LOGIC;
			col			:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			-- to memory
			MA				: out std_logic_vector(17 downto 0);
			MLB			: out std_logic;
			MUB			: out std_logic;
			MOE			: out std_logic;
			MWE			: out std_logic;
			MCE0			: out std_logic;
			MCE1			: out std_logic;
			MCE2			: out std_logic;
			MCE3			: out std_logic;
			-- to memory registers
			mem_rd0		: out std_logic;
			mem_rd1		: out std_logic;
			mem_ro0		: out std_logic;
			mem_ro1		: out std_logic;
			-- video output
			HS				:	 OUT STD_LOGIC;
			VS				:	 OUT STD_LOGIC;
			int50			:	 OUT STD_LOGIC
		);
	end component;

	component vout is
		port 
		(
			clk			:	 IN STD_LOGIC;
			BEn			:	 IN STD_LOGIC;
			blank_n		:	 IN STD_LOGIC;
			-- regs
			vdata		:	 IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ps			:	 IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			video_mode	:	 IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			-- video output
			R				:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			G				:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			B				:	 OUT STD_LOGIC_VECTOR(1 downto 0)
		);
	end component;
 
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

	component cpu_ports is
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

			intn			:	 OUT STD_LOGIC;
			MA				:	 OUT STD_LOGIC_VECTOR(20 downto 14);
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

	component ram2p
		PORT
		(
			address_a	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			address_b	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			clock			: IN STD_LOGIC  := '1';
			data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);		
			rden_a		: IN STD_LOGIC  := '1';
			rden_b		: IN STD_LOGIC  := '1';
			wren_a		: IN STD_LOGIC  := '0';
			wren_b		: IN STD_LOGIC  := '0';
			q_a			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;

--------------------------------------------------------------------------------
--                          ГЛОБАЛЬНЫЕ СИГНАЛЫ                                --
--------------------------------------------------------------------------------
signal clk_50MHz			: std_logic;	-- сигнал с генератора, только для PLL!!!
signal clk_25MHz			: std_logic;
signal clk_RAM				: std_logic;
signal clk_300MHz			: std_logic;
signal KEY_debounced		: std_logic_vector(3 downto 0);

--------------------------------------------------------------------------------
--                         ВНЕШНИЕ СИГНАЛЫ ОРИОНА                             --
--------------------------------------------------------------------------------
signal or_reset_btn		: std_logic;
signal or_ready			: std_logic := '1';
signal wide_enable		: std_logic;

--------------------------------------------------------------------------------
--                       ВНУТРЕННИЕ СИГНАЛЫ ОРИОНА                            --
--------------------------------------------------------------------------------
signal R		: std_logic_vector(1 downto 0);
signal G		: std_logic_vector(1 downto 0);
signal B		: std_logic_vector(1 downto 0);

--------------------------------------------------------------------------------
--                          ВИДЕО СИГНАЛЫ ОРИОНА                              --
--------------------------------------------------------------------------------
signal BEn		: std_logic;
signal blank_n	: std_logic;
signal col		: std_logic_vector (1 downto 0);
signal vaddr	: std_logic_vector (15 downto 0);

signal RR		: std_logic;
signal GG		: std_logic;
signal BB		: std_logic;

signal pF8		: std_logic;
signal pFC		: std_logic;

signal ps1				: std_logic_vector (7 downto 0);
signal ps2				: std_logic_vector (7 downto 0);
signal ps				: std_logic_vector (7 downto 0);
signal video_mode		: std_logic_vector (4 downto 0);

signal vdata			: std_logic_vector (31 downto 0);
signal mem_cpu			: std_logic;
signal BE2n				: std_logic;
signal SCE1				: std_logic;
signal SCE2				: std_logic;
signal SCE3				: std_logic;
signal mem_addr		: std_logic_vector(18 downto 0);

--------------------------------------------------------------------------------
--                         СИГНАЛЫ ПРОЦЕССОРА ОРИОНА                          --
--------------------------------------------------------------------------------

signal rom1_data			: std_logic_vector(7 downto 0);
signal rom2_data			: std_logic_vector(7 downto 0);

--signal busrqn				: std_logic;
signal haltn				: std_logic;
signal busakn				: std_logic;

signal rom1_sel			: std_logic;
signal rom2_sel			: std_logic;
signal ctrl_turbo_n		: std_logic;
signal rom2_addr			: std_logic_vector(2 downto 0);

--------------------------------------------------------------------------------
--                            ВНУТРЕННИЯ ШИНА                                 --
--------------------------------------------------------------------------------
signal MA			: std_logic_vector(20 downto 14);
signal resetn		: std_logic;
signal ZCLK				: std_logic;
signal ZD			: std_logic_vector(7 downto 0);
signal ZA			: std_logic_vector(15 downto 0);
signal ZWR			: std_logic;
signal ZRD			: std_logic;
signal ZMREQ		: std_logic;
signal ZIORQ		: std_logic;
signal ZRFSH		: std_logic;
signal ZM1			: std_logic;
signal ZRES			: std_logic;
signal ZINT			: std_logic;
signal waitn		: std_logic;
signal holdn		: std_logic;
signal nmin			: std_logic;
signal irqSn		: std_logic;
signal irq1n		: std_logic;
signal irq2n		: std_logic;
signal irq3n		: std_logic;
signal irq4n		: std_logic;
signal irq5n		: std_logic;
signal irq6n		: std_logic;
signal irq7n		: std_logic;
signal blion		: std_logic;
signal int50Hz		: std_logic;
signal UP4			: std_logic;

/*signal SMA			: std_logic_vector(17 downto 0);
signal SMD			: std_logic_vector(15 downto 0);
signal SOE			: std_logic;
signal SUB			: std_logic;
signal SLB			: std_logic;
signal SCE			: std_logic;
signal SWE			: std_logic;
signal bank			: std_logic_vector(15 downto 0);
signal mdata0		: std_logic_vector(7 downto 0);
signal mdata1		: std_logic_vector(7 downto 0);
signal mdata2		: std_logic_vector(7 downto 0);
signal mdata3		: std_logic_vector(7 downto 0);*/


signal mem_rd0			: STD_LOGIC;
signal mem_rd1			: STD_LOGIC;
signal mem_ro0			: STD_LOGIC;
signal mem_ro1			: STD_LOGIC;
signal mem_wr0			: STD_LOGIC;
signal mem_wr1			: STD_LOGIC;
signal mem_buf_rd0	: std_logic_vector(7 downto 0);
signal mem_buf_rd1	: std_logic_vector(7 downto 0);
signal mem_buf_wr0	: std_logic_vector(7 downto 0);
signal mem_buf_wr1	: std_logic_vector(7 downto 0);

begin
--------------------------------------------------------------------------------
--                       СВЯЗЬ СИГНАЛОВ С ПИНАМИ МС                           --
--------------------------------------------------------------------------------
clk_50MHz <= CLOCK_50;
LEDR(0) <= ZD(0);
LEDR(1) <= ZD(1);
LEDR(2) <= ZD(2);
LEDR(3) <= ZD(3);
LEDR(4) <= ZD(4);
LEDR(5) <= ZD(5);
LEDR(6) <= ZD(6);
LEDR(7) <= ZD(7);
LEDR(8) <= resetn;
LEDR(9) <= '0';
HEX0 <= (others => '1');
HEX1 <= (others => '1');
HEX2 <= (others => '1');
HEX3 <= (others => '1');
HEX4 <= (others => '1');
HEX5 <= (others => '1');

wide_enable <= SW(9);

ZRES <= resetn;

--------------------------------------------------------------------------------
--                      ПОДКЛЮЧЕНИЕ ВНЕШНИХ МОДУЛЕЙ                           --
--------------------------------------------------------------------------------
-- основной PLL
pll_orion: orion_pll
	port map (
		clk_50MHz,
		'0',
		clk_25MHz,
		clk_RAM,
		clk_300MHz
	);

deb: debounce
	port map (
		clk_300MHz,
		'1',
		KEY,
		KEY_debounced
	);

--------------------------------------------------------------------------------
--                            ВИДЕО И ПАМЯТЬ                                  --
--------------------------------------------------------------------------------

vm: vmem
	port map (
		clk_25MHz,
		clk_RAM,
		wide_enable,
		SW(8),
		ZCLK,
		resetn,
		ZA,
		ZD(1 downto 0),
		ZD(5 downto 3),
		ZD(7),
		ZIORQ,
		ZMREQ,
		ZWR,
		ZRD,
		ZRFSH,
		blion,
		MA,
		pF8,
		pFC,
		BEn,
		blank_n,
		col,
		SMA,
		SLB,
		SUB,
		SOE,
		SWE,
		SCE,
		SCE1,
		SCE2,
		SCE3,
		mem_rd0,
		mem_rd1,
		mem_ro0,
		mem_ro1,
		VGA_HS,
		VGA_VS,
		int50Hz
	);

SMD(7  downto 0) <= ZD when (SWE = '0') else (others => 'Z');
SMD(15 downto 8) <= ZD when (SWE = '0') else (others => 'Z');

process (mem_rd0)
begin
	if (rising_edge(mem_rd0)) then
		mem_buf_rd0 <= SMD(7 downto 0);
	end if;
end process;
ZD <= mem_buf_rd0 when (mem_ro0 = '0') else (others => 'Z');

process (mem_rd1)
begin
	if (rising_edge(mem_rd0)) then
		mem_buf_rd1 <= SMD(15 downto 8);
	end if;
end process;
ZD <= mem_buf_rd1 when (mem_ro1 = '0') else (others => 'Z');


process (resetn, pF8)
begin
	if (resetn = '0') then
		video_mode <= (others => '0');
	elsif (rising_edge(pF8)) then
		video_mode <= ZD(4 downto 0);
	end if;
end process;

-- pseudo color regs
pc1: process (pFC)
begin
	if (rising_edge(pFC)) then
		ps1 <= ZD;
	end if;
end process;

pc2: process (BEn, SMD)
begin
	if (BEn = '0') then
		ps2 <= SMD(15 downto 8);
	end if;
end process;

ps <= ps1 when (video_mode(3) = '1') else ps2;

-- video data
vd0: process (col(0))
begin
	if (rising_edge(col(0))) then
		vdata(7 downto 0) <= SMD(7 downto 0);
	end if;
end process;

vd1: process (col(0))
begin
	if (rising_edge(col(0))) then
		vdata(15 downto 8) <= SMD(15 downto 8);
	end if;
end process;

vd2: process (col(1))
begin
	if (rising_edge(col(1))) then
		vdata(23 downto 16) <= SMD(7 downto 0);
	end if;
end process;

vd3: process (col(1))
begin
	if (rising_edge(col(1))) then
		vdata(31 downto 24) <= SMD(15 downto 8);
	end if;
end process;

vo: vout
	port map (
		clk_25MHz,
		BEn,
		blank_n,
		vdata,
		ps,
		video_mode,
		R,
		G,
		B
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
VGA_BLANK_N <= blank_n;

--------------------------------------------------------------------------------
--                                  CPU                                       --
--------------------------------------------------------------------------------

waitn <= '1';
nmin <= '1';

Z80: T80a
	port map (
		resetn,
		ZCLK,
		waitn,
		ZINT,
		nmin,
		'1',
		ZM1,
		ZMREQ,
		ZIORQ,
		ZRD,
		ZWR,
		ZRFSH,
		haltn,
		busakn,
		ZA,
		ZD
	);

-- signals processing
resetn <= KEY_debounced(0);

ports: cpu_ports
	port map (
		clk_25MHz,
		ZD,
		ZA,
		ZM1,
		ZIORQ,
		ZMREQ,
		ZRD,
		ZWR,
		ZRFSH,
		resetn,
		ZINT,
		MA,
		rom1_sel,
		rom2_sel,
		ctrl_turbo_n,
		rom2_addr,
		blion,
		int50Hz,
		SW(7 downto 0),
		irqSn,
		irq1n,
		irq2n,
		irq3n,
		irq4n,
		irq5n,
		irq6n,
		irq7n
	);

r1: rom1
	port map (
		ZA(12 downto 0),
		clk_300MHz,
		not (ZRD or rom1_sel),
		rom1_data
	);
ZD <= rom1_data when ((ZRD='0') and (rom1_sel='0')) else (others => 'Z');

/*r2: rom2
	port map (
		rom2_addr(2) & rom2_addr(1) & rom2_addr(0) & addr(12 downto 0),
		clk_300MHz,
		not (ZRD or rom2_sel),
		rom2_data
	);
ZD <= rom2_data when ((ZRD='0') and (rom2_sel='0')) else (others => 'Z');*/

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
