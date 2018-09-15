library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mod_video is
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
		ram_vm_oe0	:	 IN STD_LOGIC;
		ram_vm_oe1	:	 IN STD_LOGIC;
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
end;

architecture rtl of mod_video is

	component cnt_sync is
		port (
			clk			:	 IN STD_LOGIC;
			res_n			:	 IN STD_LOGIC;
			ldn_n			:	 IN STD_LOGIC;
			ldn_val		:	 IN STD_LOGIC_VECTOR(9 downto 0);
			cnt			:	 OUT STD_LOGIC_VECTOR(9 downto 0)
		);
	end component;

	component gal_x is
		port (
			SR16			:	 IN STD_LOGIC;
			wide_en		:	 IN STD_LOGIC;
			clk_sel		:	 IN STD_LOGIC;
			ctrl_turbo_n:	 IN STD_LOGIC;
			x				:	 IN STD_LOGIC_VECTOR(9 downto 0);
			col			:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			clk_sig		:	 OUT STD_LOGIC;
			XRESN			:	 OUT STD_LOGIC;
			BEn			:	 OUT STD_LOGIC;
			BH				:	 OUT STD_LOGIC;
			HS				:	 OUT STD_LOGIC;
			XLE			:	 OUT STD_LOGIC
		);
	end component;

	component gal_y is
		port (
			clk			:	 IN STD_LOGIC;
			wide_en		:	 IN STD_LOGIC;
			BH				:	 IN STD_LOGIC;
			XRESN			:	 IN STD_LOGIC;
			y				:	 IN STD_LOGIC_VECTOR(9 downto 0);
			YRESN			:	 OUT STD_LOGIC;
			blank_n		:	 OUT STD_LOGIC;
			int50			:	 OUT STD_LOGIC;
			VS				:	 OUT STD_LOGIC
		);
	end component;

	component gal_vout is
		port 
		(
			blank_n		:	 IN STD_LOGIC;
			video_mode0	:	 IN STD_LOGIC;
			video_mode1	:	 IN STD_LOGIC;
			video_mode2	:	 IN STD_LOGIC;
			video_mode4	:	 IN STD_LOGIC;
			ps				:	 IN STD_LOGIC_VECTOR(7 downto 0);
			pxls			:	 IN STD_LOGIC_VECTOR(3 downto 0);
			R				:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			G				:	 OUT STD_LOGIC_VECTOR(1 downto 0);
			B				:	 OUT STD_LOGIC_VECTOR(1 downto 0)
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

-- video signals
signal blank_n			: std_logic;
signal vb				: std_logic_vector(1 downto 0);
signal col				: std_logic_vector(1 downto 0);

signal x					: std_logic_vector(9 downto 0);
signal BEn				: std_logic;
signal BH				: std_logic;
signal XLE				: std_logic;
signal XRESN			: std_logic;

signal y					: std_logic_vector(9 downto 0);
signal YRESN			: std_logic;

signal wrdata			: std_logic_vector (31 downto 0);
signal vmem				: std_logic_vector (16 downto 0);
signal vdata			: std_logic_vector (31 downto 0);

signal mem_data		: std_logic_vector (31 downto 0);

-- video ports data
signal SR16				: std_logic;
signal video_mode		: std_logic_vector(4 downto 0);
signal video_bank		: std_logic_vector(1 downto 0);
signal ps1				: std_logic_vector (7 downto 0);
signal ps2				: std_logic_vector (7 downto 0);
signal ps				: std_logic_vector (7 downto 0);

signal res_cnt			: std_logic_vector(5 downto 0);

-- video registers
signal preg0		: std_logic_vector(7 downto 0);
signal preg1		: std_logic_vector(7 downto 0);
signal preg2		: std_logic_vector(7 downto 0);
signal preg3		: std_logic_vector(7 downto 0);
signal pxls			: std_logic_vector(3 downto 0);

signal vm14			: std_logic;
signal vm12			: std_logic;
signal vm_ps		: std_logic;
signal vm_st		: std_logic;
signal vm_pr		: std_logic;
signal sel16		: std_logic;

signal RR			: std_logic;
signal GG			: std_logic;
signal BB			: std_logic;
signal II			: std_logic;

begin

cntx: cnt_sync
	port map (
		clk,
		XRESN,
		'1',
		"0000000000",
		x
	);

gx: gal_x
	port map (
		SR16,
		wide_en,
		clk_sel,
		ctrl_turbo_n,
		x,
		col,
		clk_sig,
		XRESN,
		BEn,
		BH,
		HS,
		XLE
	);

cnty: cnt_sync
	port map (
		XLE and clk,
		YRESN,
		'1',
		"0000000000",
		y
	);

gy: gal_y
	port map (
		clk,
		wide_en,
		BH,
		XRESN,
		y,
		YRESN,
		blank_n,
		int50,
		VS
	);

-- port F8
F8: process (pF8, resetn)
begin
	if (resetn = '0') then
		video_mode <= (others => '0');
	elsif (rising_edge(pF8)) then
		video_mode <= data(4 downto 0);
	end if;
end process;

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

vb(1) <= not video_bank(1);
vb(0) <= not x(2);

--vmem_sel(0) <= (not ram_cen_v) and (not ram_lbn) and ram_ubn;
--vmem_sel(1) <= (not ram_cen_v) and ram_lbn and (not ram_ubn);

b0: ram2p
	port map (
		address_a	=> vb & x(8 downto 3) & y(7 downto 0),
		address_b	=> ram_addr_hi & addr(13 downto 0),
		clock			=> clk_mem,
		data_a		=> "00000000",
		data_b		=> data,
		rden_a		=> '1',
		rden_b		=> ((not ram_rdn) and (not ram_vm_oe0)),
		wren_a		=> '0',
		wren_b		=> ((not ram_wrn) and (not ram_vm_oe0)),
		q_a			=> vmem(7 downto 0),
		q_b			=> mem_data(7 downto 0)
	);
data <= mem_data(7 downto 0) when (ram_vm_oe0='0') and (ram_wrn='1')
	else (others => 'Z');

b1: ram2p
	port map (
		address_a	=> vb & x(8 downto 3) & y(7 downto 0),
		address_b	=> ram_addr_hi & addr(13 downto 0),
		clock			=> clk_mem,
		data_a		=> "00000000",
		data_b		=> data,
		rden_a		=> '1',
		rden_b		=> ((not ram_rdn) and (not ram_vm_oe1)),
		wren_a		=> '0',
		wren_b		=> ((not ram_wrn) and (not ram_vm_oe1)),
		q_a			=> vmem(15 downto 8),
		q_b			=> mem_data(15 downto 8)
	);
data <= mem_data(15 downto 8) when (ram_vm_oe1='0') and (ram_wrn='1')
	else (others => 'Z');

-- video registers
vr0: process (col(0), vmem)
begin
	if (col(0) = '1') then
		vdata(7 downto 0) <= vmem(7 downto 0);
	end if;
end process;

vr1: process (col(0), vmem)
begin
	if (col(0) = '1') then
		vdata(15 downto 8) <= vmem(15 downto 8);
	end if;
end process;

vr2: process (col(1), vmem)
begin
	if (col(1) = '1') then
		vdata(23 downto 16) <= vmem(7 downto 0);
	end if;
end process;

vr3: process (col(1), vmem)
begin
	if (col(1) = '1') then
		vdata(31 downto 24) <= vmem(15 downto 8);
	end if;
end process;

-- color shift registers
pxls(0) <= preg0(7);
p0: process (clk)
begin
	if (rising_edge(clk)) then
		if (BEn = '0') then
			preg0 <= vdata(7 downto 0);
		else
			preg0(0) <= '0';
			preg0(7 downto 1) <= preg0(6 downto 0);
		end if;
	end if;
end process;

pxls(1) <= preg1(7);
p1: process (video_mode, clk)
begin
	if (video_mode(2) = '0') then
		preg1 <= (others => '0');
	elsif (rising_edge(clk)) then
		if (BEn = '0') then
			preg1 <= vdata(15 downto 8);
		else
			preg1(0) <= '0';
			preg1(7 downto 1) <= preg1(6 downto 0);
		end if;
	end if;
end process;

pxls(2) <= preg2(7);
p2: process (clk)
begin
	if (rising_edge(clk)) then
		if (BEn = '0') then
			preg2 <= vdata(23 downto 16);
		else
			preg2(0) <= '0';
			preg2(7 downto 1) <= preg2(6 downto 0);
		end if;
	end if;
end process;

pxls(3) <= preg3(7);
p3: process (clk)
begin
	if (rising_edge(clk)) then
		if (BEn = '0') then
			preg3 <= vdata(31 downto 24);
		else
			preg3(0) <= '0';
			preg3(7 downto 1) <= preg3(6 downto 0);
		end if;
	end if;
end process;

-- pseudo color regs
pc1: process (pFC)
begin
	if (rising_edge(pFC)) then
		ps1 <= data;
	end if;
end process;

pc2: process (BEn)
begin
	if (rising_edge(BEn)) then
		ps2 <= vdata(15 downto 8);
	end if;
end process;

ps <= ps1 when (video_mode(3) = '1') else ps2;

vo: gal_vout
	port map (
		blank_n,
		video_mode(0),
		video_mode(1),
		video_mode(2),
		video_mode(4),
		ps,
		pxls,
		R,
		G,
		B
	);

end rtl;
