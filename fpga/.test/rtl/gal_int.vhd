library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gal_int is
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
end;

architecture rtl of gal_int is

signal intan		: std_logic;
signal dirq			: std_logic;
signal irq_vector	: std_logic_vector(2 downto 0);

begin

-- interrupts
intan <= iorqn or m1n;
irq_vector <= "000" when (irq0n = '0')
			else "001" when (irq1n = '0')
			else "010" when (irq2n = '0')
			else "011" when (irq3n = '0')
			else "100" when (irq4n = '0')
			else "101" when (irq5n = '0')
			else "110" when (irq6n = '0')
			else "111" when (irq7n = '0');
dirq <= irq0n and irq1n and irq2n and irq3n and irq4n and irq5n and irq6n and irq7n;
data <= "0000" & irq_vector & '0' when (intan='0') else (others => 'Z');
intn <= dirq and irqSn;

end rtl;
