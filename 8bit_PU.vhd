library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_PU is
		port(operation : in std_logic_vector (2 downto 0);
			 Clk	   : in std_logic;
			 operand1  : in std_logic_vector (7 downto 0);
	   		 operand2  : in std_logic_vector (7 downto 0);
			 result	   : out std_logic_vector(7 downto 0)
			 );	 
end bit_PU;

architecture proc of bit_PU is
		function Add (op1 : std_logic_vector (7 downto 0);
                      op2 : std_logic_vector (7 downto 0)) return std_logic_vector is
		variable res: std_logic_vector (7 downto 0);  
		begin
			res := std_logic_vector((unsigned(op1)+unsigned(op2)) mod 256);
			return res;
		end function;

begin

		process(Clk) is
		begin
			if rising_edge(Clk) then
					result <= Add(operand1, operand2);
			end if;
		end process;

end architecture;


