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
		snd			:	 OUT STD_LOGIC;
		ctrl_turbo_n:	 OUT std_logic;
		pF8			:	 OUT std_logic;
		pFA			:	 OUT std_logic;
		pFB			:	 OUT std_logic;
		pFC			:	 OUT std_logic;
		ram_cen		:	 OUT std_logic_vector(3 downto 0);
		ram_buf_oe	:	 OUT std_logic;
		ram_vm_oe0	:	 OUT STD_LOGIC;
		ram_vm_oe1	:	 OUT STD_LOGIC;
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

	component gal_int is
		port 
		(
			irqSn			:	 IN STD_LOGIC;
			irq0n			:	 IN STD_LOGIC;
			irq1n			:	 IN STD_LOGIC;
			irq2n			:	 IN STD_LOGIC;
			irq3n			:	 IN STD_LOGIC;
			irq4n			:	 IN STD_LOGIC;
			irq5n			:	 IN STD_LOGIC;
			irq6n			:	 IN STD_LOGIC;
			irq7n			:	 IN STD_LOGIC;
			m1n			:	 IN STD_LOGIC;
			iorqn			:	 IN STD_LOGIC;
			intn			:	 OUT STD_LOGIC;
			data			:	 OUT STD_LOGIC_VECTOR(7 downto 0)
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
			waitn			:	 OUT STD_LOGIC;

			snd			:	 OUT STD_LOGIC;
			MA				:	 OUT STD_LOGIC_VECTOR(18 downto 14);
			rom1_sel		:	 OUT STD_LOGIC;
			rom2_sel		:	 OUT STD_LOGIC;
			rom3_sel		:	 OUT STD_LOGIC;
			turbo_n		:	 OUT STD_LOGIC;
			rom2_addr	:	 OUT STD_LOGIC_VECTOR(18 downto 13);
			addr_hi		:	 OUT STD_LOGIC_VECTOR(15 downto 14);

			ram_wrn		:	 OUT STD_LOGIC;
			ram_rdn		:	 OUT STD_LOGIC;
			ram_cen_v	:	 OUT STD_LOGIC;
			ram_cen		:	 OUT STD_LOGIC_VECTOR(3 downto 0);
			ram_buf_oe	:	 OUT STD_LOGIC;
			ram_vm_oe0	:	 OUT STD_LOGIC;
			ram_vm_oe1	:	 OUT STD_LOGIC;
			pF8			:	 OUT std_logic;
			pFA			:	 OUT std_logic;
			pFB			:	 OUT std_logic;
			pFC			:	 OUT std_logic;
			irq0n			:	 OUT std_logic;

			blion			:	 IN STD_LOGIC;
			int50			:	 IN STD_LOGIC;
			config		:	 IN STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;

-- interrupts
signal qrd			: std_logic;
signal irq0n		: std_logic;

-- signals
signal intn			: std_logic;
signal rom1_sel	: std_logic;
signal rom2_sel	: std_logic;
signal rom3_sel	: std_logic;

signal rom1_data	: std_logic_vector(7 downto 0);
signal rom2_data	: std_logic_vector(7 downto 0);
signal rom2_addr	: std_logic_vector(18 downto 13);

-- BUS inner
signal ZA						: std_logic_vector(15 downto 0);
signal addr_in					: std_logic_vector(15 downto 0);
signal iorqn_in				: std_logic;
signal mreqn_in				: std_logic;
signal rfshn_in				: std_logic;
signal wrn_in					: std_logic;
signal rdn_in					: std_logic;
signal m1n_in					: std_logic;
signal MA						: std_logic_vector(18 downto 14);

signal waitn				: std_logic;
signal nmin					: std_logic;
signal haltn				: std_logic;
signal busakn				: std_logic;

begin

nmin <= '1';

Z80: T80a
	port map (
		resetn,
		clk_sig,
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
		rom2_addr(15 downto 13) & addr_in(12 downto 0),
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

addr_in(13 downto 0) <= ZA(13 downto 0);

int: gal_int
	port map (
		irqSn,
		irq0n,
		irq1n,
		irq2n,
		irq3n,
		irq4n,
		irq5n,
		irq6n,
		irq7n,
		m1n_in,
		iorqn_in,
		intn,
		data
	);

ports: cpu_ports
	port map (
		clk,
		data,
		ZA,
		m1n_in,
		iorqn_in,
		mreqn_in,
		rdn_in,
		wrn_in,
		rfshn_in,
		resetn,
		waitn,
		
		snd,
		MA,
		rom1_sel,
		rom2_sel,
		rom3_sel,
		ctrl_turbo_n,
		rom2_addr,
		addr_in(15 downto 14),
		
		ram_wrn,
		ram_rdn,
		ram_cen_v,
		ram_cen,
		ram_buf_oe,
		ram_vm_oe0,
		ram_vm_oe1,
		pF8,
		pFA,
		pFB,
		pFC,
		irq0n,
		
		blion,
		int50,
		config
	);

ram_addr_hi <= MA(18) & MA(17) & MA(15 downto 14);
ram_lbn <= MA(16);
ram_ubn <= not MA(16);

end rtl;
