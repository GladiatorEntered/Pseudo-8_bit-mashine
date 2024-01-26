library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_Tb is
end bit_Tb;

architecture proc of bit_Tb is

signal   Clk  : std_logic  := '0';
constant Freq : integer    := 100;
constant PeriodTime : time := 1000 ms / Freq;
signal	 operation  : std_logic_vector (2 downto 0) := "000";
signal   result     : std_logic_vector (7 downto 0);
signal   operand1   : std_logic_vector (7 downto 0) := (others => '0');
signal   operand2   : std_logic_vector (7 downto 0) := (others => '0');

		component bit_PU
			port(operation : in std_logic_vector (2 downto 0);
				 Clk	   : in std_logic;
				 operand1  : in std_logic_vector (7 downto 0);
	   			 operand2  : in std_logic_vector (7 downto 0);
			 	 result	   : out std_logic_vector(7 downto 0)
				 );
		end component;

begin
i_bit_PU : bit_PU port map(Clk => Clk,
		 operation => operation,
		 operand1  => operand1,
		 operand2  => operand2,
		 result    => result);

Clk <= not Clk after PeriodTime / 2;

process is
begin
report "HO-HO!";
wait;
end process;

process (Clk) is
begin
		report "YEAH";
		if rising_edge(Clk) then
			if unsigned(operand1) > unsigned(operand2) then
				operand1 <= std_logic_vector((unsigned(operand1)+1) mod 256);
			else
				operand2 <= std_logic_vector((unsigned(operand2)+1) mod 256);
			end if;
		else
			report "NOPE";
		end if;
end process;


end architecture;


