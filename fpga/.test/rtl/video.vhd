-- altera vhdl_input_version vhdl_2008

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity video is
	port (
		clk_25		: in  std_logic;
		wide_enable	: in  std_logic;
		-- video output
		R				: out std_logic_vector(1 downto 0);
		G				: out std_logic_vector(1 downto 0);
		B				: out std_logic_vector(1 downto 0);
		HS				: out std_logic;
		VS				: out std_logic;
		BLn			: out std_logic;
		-- memory
		SMA			: out std_logic_vector(17 downto 0);
		SMD			: inout std_logic_vector(15 downto 0);
		SOE			: out std_logic;
		SUB			: out std_logic;
		SLB			: out std_logic;
		SCE			: out std_logic;
		SWE			: out std_logic;
		-- from CPU
		data			: inout std_logic_vector(7 downto 0);
		addr			: in std_logic_vector(15 downto 0);
		MA				: in std_logic_vector(19 downto 14);
		resetn		: in  std_logic;
		wrn			: in  std_logic;
		rdn			: in  std_logic;
		mreqn			: in  std_logic;
		iorqn			: in  std_logic;
		m1n			: in  std_logic;
		waitn			: out std_logic;
		holdn			: out std_logic;
		nmin			: out std_logic;
		irqSn			: inout std_logic;
		irq1n			: inout std_logic;
		irq2n			: inout std_logic;
		irq3n			: inout std_logic;
		irq4n			: inout std_logic;
		irq5n			: inout std_logic;
		irq6n			: inout std_logic;
		irq7n			: inout std_logic;
		blion			: inout std_logic;
		int50Hz		: out std_logic;
		UP4			: in  std_logic;
		mem_rdn		: in  std_logic;
		mem_wrn		: in  std_logic
	);
end entity;

architecture rtl of video is

begin

end rtl;
