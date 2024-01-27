library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_Tb is
end bit_Tb;

architecture proc of bit_Tb is

		component bit_PU is
			port(operation : in std_logic_vector (2 downto 0);
				 Clk	   : in std_logic;
				 operand1  : in std_logic_vector (7 downto 0);
	   			 operand2  : in std_logic_vector (7 downto 0);
				 result	   : out std_logic_vector(7 downto 0) 
				 );
		end component bit_PU;

signal   Clk  : std_logic  := '0';
constant Freq : integer    := 100;
constant PeriodTime : time := 1000 ms / Freq;
signal	 operation  : std_logic_vector (2 downto 0) := "001";
signal   result     : std_logic_vector (7 downto 0) := (others => '0');
signal   operand1   : std_logic_vector (7 downto 0) := (others => '0');
signal   operand2   : std_logic_vector (7 downto 0) := (others => '0');
begin

	i_bit_PU: component bit_PU
   	port map(Clk => Clk,
	 operation => operation,
	 operand1  => operand1,
	 operand2  => operand2,
	 result    => result);

	Clk <= not Clk after PeriodTime / 2;

	process (Clk) is
	begin
		if rising_edge(Clk) then
			operation <=std_logic_vector(unsigned(operation)+5);
			if unsigned(operand1) < unsigned(operand2) or (operand1 = x"FF" and operand2 = x"00") then
				operand1 <= std_logic_vector((unsigned(operand1)+1) mod 256);
			else
				operand2 <= std_logic_vector((unsigned(operand2)+1) mod 256);
			end if;
		end if;
end process;


end architecture;


