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
		function "+" (op1 : std_logic_vector (7 downto 0);
                      op2 : std_logic_vector (7 downto 0)) return std_logic_vector is
		variable res: std_logic_vector (7 downto 0);  
		begin
			res := std_logic_vector((unsigned(op1)+unsigned(op2)) mod 256);
			return res;
		end function;


		function "-" (op1 : std_logic_vector (7 downto 0);
                      op2 : std_logic_vector (7 downto 0)) return std_logic_vector is
		variable res: std_logic_vector (7 downto 0);  
		begin
			if unsigned(op1) < unsigned(op2) then 	
				res := std_logic_vector((unsigned(op2)-unsigned(op1)) mod 256);
			else
				res := std_logic_vector((unsigned(op1)-unsigned(op2)) mod 256);
			end if;
			return res;
		end function;

begin

	process(Clk) is --may cause errors in future
	begin
		case operation is
			when "000"   =>
					result <= operand1 + operand2;
			when "001"   =>
					result <= operand1 - operand2;	
			when "010"   =>
					result <= operand1 or operand2;
		    when "011"   => 
					result <= operand1 and operand2;
			when "100"   =>
					result <= operand1 nand operand2;
			when "101"   =>
					result <= operand1 xor operand2;
			when "111"   =>
					result <= x"FF";
			when others  =>
				result <= "UUUUUUUU";
		end case;
	end process;

end architecture;


