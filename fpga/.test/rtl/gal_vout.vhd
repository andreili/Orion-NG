library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gal_vout is
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
end;

architecture rtl of gal_vout is

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

-- video modes manage
vm14 <= video_mode1 or video_mode4;
vm12 <= not (video_mode1 and video_mode2 and (not video_mode4));
vm_ps <= vm12 or (not blank_n);
vm_st <= vm14 or (not blank_n);
vm_pr <= not ((not blank_n) or (vm14 and vm12));
sel16 <= (not blank_n) or (not video_mode4);

-- video data switchers
process (vm_st, pxls, video_mode0)
begin
	if (vm_st = '1') then
		RR <= 'Z';
		GG <= 'Z';
		BB <= 'Z';
		II <= 'Z';
	elsif (pxls(1) = '0') then
		RR <= video_mode0 and pxls(0);
		GG <= video_mode0 or pxls(0);
		BB <= video_mode0 and (not pxls(0));
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
