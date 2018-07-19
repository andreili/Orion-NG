library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vout is
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
end entity;

architecture rtl of vout is

signal vm14			: std_logic;
signal vm12			: std_logic;
signal vm_ps		: std_logic;
signal vm_st		: std_logic;
signal vm_pr		: std_logic;
signal stG			: std_logic;
signal stR			: std_logic;
signal sel16		: std_logic;

signal preg0		: std_logic_vector(7 downto 0);
signal preg1		: std_logic_vector(7 downto 0);
signal preg2		: std_logic_vector(7 downto 0);
signal preg3		: std_logic_vector(7 downto 0);
signal pxls			: std_logic_vector(3 downto 0);

signal RR			: std_logic;
signal GG			: std_logic;
signal BB			: std_logic;
signal II			: std_logic;

begin

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
p1: process (video_mode(2), clk)
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

-- video modes manage
vm14 <= video_mode(1) or video_mode(4);
vm12 <= not (video_mode(1) and video_mode(2) and (not video_mode(4)));
vm_ps <= vm12 or (not blank_n);
vm_st <= vm14 or (not blank_n);
vm_pr <= not ((not blank_n) or (vm14 and vm12));
stG <= pxls(0) or (not video_mode(0));
stR <= not (pxls(0) or video_mode(0));
sel16 <= (not blank_n) or (not video_mode(4));

-- video data switchers
process (vm_st, pxls, stR, stG)
begin
	if (vm_st = '1') then
		RR <= 'Z';
		GG <= 'Z';
		BB <= 'Z';
		II <= 'Z';
	elsif (pxls(1) = '0') then
		RR <= video_mode(0) and pxls(0);
		GG <= video_mode(0) or pxls(0);
		BB <= video_mode(0) and (not pxls(0));
		II <= '0';
	else
		RR <= (not pxls(0));
		GG <= '0';
		BB <= pxls(0);
		II <= '0';
	end if;
end process;

process (vm_ps, pxls(0), ps)
begin
	if (vm_ps = '1') then
		RR <= 'Z';
		GG <= 'Z';
		BB <= 'Z';
		II <= 'Z';
	elsif (pxls(0) = '0') then
		BB <= ps(4);
		GG <= ps(5);
		RR <= ps(6);
		II <= ps(7);
	else
		BB <= ps(0);
		GG <= ps(1);
		RR <= ps(2);
		II <= ps(3);
	end if;
end process;

process (vm_pr, sel16, pxls)
begin
	if (vm_pr = '1') then
		RR <= 'Z';
		GG <= 'Z';
		BB <= 'Z';
		II <= 'Z';
	elsif (sel16 = '0') then
		BB <= pxls(3);
		GG <= pxls(0);
		RR <= pxls(2);
		II <= pxls(1);
	else
		BB <= '0';
		GG <= '0';
		RR <= '0';
		II <= '0';
	end if;
end process;

R(0) <= RR;
R(1) <= RR and II;
G(0) <= GG;
G(1) <= GG and II;
B(0) <= BB;
B(1) <= BB and II;

end rtl;
