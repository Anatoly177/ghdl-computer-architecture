library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity scheme is
	port (
	A : in std_logic;
	B : in std_logic;
	C_IN : in std_logic;
	S : out std_logic;
	C_OUT : out std_logic
	);
end entity scheme;

architecture BEHAVIORAL of scheme is
begin

	S <= (A XOR B) XOR C_IN;
	C_OUT <= (A AND B) OR ((A XOR B) AND C_IN);

end architecture BEHAVIORAL;
