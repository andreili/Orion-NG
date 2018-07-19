library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity vmem is
	port 
	(
		clk			:	 IN STD_LOGIC;
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
end;

architecture rtl of vmem is
	component counter_x is
		port (
			clk			:	 IN STD_LOGIC;
			SR16			:	 IN STD_LOGIC;
			wide_en		:	 IN STD_LOGIC;
			x				:	 OUT STD_LOGIC_VECTOR(9 downto 0);
			BE				:	 OUT STD_LOGIC;
			BH				:	 OUT STD_LOGIC;
			HS				:	 OUT STD_LOGIC;
			XLE			:	 OUT STD_LOGIC
		);
	end component;
	
	component counter_y is
		port (
			clk			:	 IN STD_LOGIC;
			XLE			:	 IN STD_LOGIC;
			wide_en		:	 IN STD_LOGIC;
			y				:	 OUT STD_LOGIC_VECTOR(9 downto 0);
			BV				:	 OUT STD_LOGIC;
			int50			:	 OUT STD_LOGIC;
			VS				:	 OUT STD_LOGIC
		);
	end component;

	component video_ports is
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
	end component;

signal x					: std_logic_vector(9 downto 0);
signal BE				: std_logic;
signal BH				: std_logic;
signal XLE				: std_logic;

signal clk_normal		: std_logic;
signal clk_turbo		: std_logic;

signal y					: std_logic_vector(9 downto 0);
signal BV				: std_logic;

signal pFA				: std_logic;

signal ctrl_turbo_n	: std_logic;
signal mem_wrn			: std_logic;
signal mem_rdn			: std_logic;

signal video_mode4	: std_logic;
signal SR16				: std_logic;
signal video_bank		: std_logic_vector(1 downto 0);
signal vb				: std_logic_vector(1 downto 0);
signal mem_bank		: std_logic_vector(3 downto 0);
signal mem_cpu			: std_logic;
signal mem_rd_strobe	: std_logic;
signal mem_ro_strobe	: std_logic;

begin

cx: counter_x
	port map (
		clk,
		SR16,
		wide_en,
		x,
		BE,
		BH,
		HS,
		XLE
	);

clk_normal <= x(2);
clk_turbo <= x(1) when (clk_sel = '0')
		  else x(0);
clk_sig <= clk_turbo when (ctrl_turbo_n = '0')
		else clk_normal;

cy: counter_y
	port map (
		clk,
		XLE, 
		wide_en,
		y,
		BV,
		int50,
		VS
	);

blank_n <= (not BH) and (not BV);

ports: video_ports
	port map (
		resetn,
		data7 & "0" & data35 & "0" & data01,
		addr,
		wrn,
		rdn,
		iorqn,
		mreqn,
		rfshn,
		blion,
		pF8,
		pFC,
		video_mode4,
		SR16, 
		video_bank,
		ctrl_turbo_n,
		mem_wrn,
		mem_rdn
	);

vb(0) <= (not video_bank(0)) when (video_mode4='0') else x(0);
vb(1) <= not video_bank(1);

-- video memory column
col(0) <= ((not x(1)) and (not x(2)) and x(0) and clk);
col(1) <= ((not x(1)) and x(2) and x(0) and clk);

BEn <= not BE;

mem_cpu <= x(1);

MA <= VA(18 downto 17) & VA(15) & VA(14) & addr(13 downto 0) when (mem_cpu = '1')
	else "00" & vb & x(8 downto 3) & y(7 downto 0);

MWE <= mem_wrn when ((mem_cpu = '1') and ((x(0) xor clk) = '1'))
	else '1';
MOE <= mem_rdn when (mem_cpu = '1')
	else '0';
MLB <= VA(16) when (mem_cpu = '1')
	else '0';
MUB <= (not VA(16)) when (mem_cpu = '1')
	else '0';

mem_bank(0) <= VA(19) or VA(20);
mem_bank(1) <= (not VA(19)) or VA(20);
mem_bank(2) <= VA(19) or (not VA(20));
mem_bank(3) <= (not VA(19)) or (not VA(20));
MCE0 <= mem_bank(0) when (mem_cpu = '1')
	else '0';
MCE1 <= mem_bank(1) when (mem_cpu = '1')
	else '1';
MCE2 <= mem_bank(2) when (mem_cpu = '1')
	else '1';
MCE3 <= mem_bank(3) when (mem_cpu = '1')
	else '1';

mem_rd_strobe <= (not mem_rdn) and mem_cpu and x(0) and clk;
mem_rd0 <= (not VA(16)) when (mem_rd_strobe = '1')
	else '0';
mem_rd1 <= VA(16) when (mem_rd_strobe = '1')
	else '0';

mem_ro_strobe <= not mem_rdn;
mem_ro0 <= VA(16) when (mem_ro_strobe = '1')
	else '1';
mem_ro1 <= (not VA(16)) when (mem_ro_strobe = '1')
	else '1';

end rtl;
