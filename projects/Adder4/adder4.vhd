library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity adder4 is  
	port (	
	A4 : in std_logic_vector(3 downto 0);
	B4 : in std_logic_vector(3 downto 0);
	SUM4 : out std_logic_vector(3 downto 0);
	C_OUT4 : out std_logic
	);
end adder4;


architecture BEHAVIORAL of adder4 is   
component scheme is
	port (
	A : in std_logic;
	B : in std_logic;
	C_IN : in std_logic;
	S : out std_logic;
	C_OUT : out std_logic
	);
end component;

signal c0, c1, c2 : std_logic;
begin
	FULL_ADDER0 : scheme
		port map (
		A => A4(0),
		B => B4(0),
		C_IN => '0',
		S => SUM4(0),
		C_OUT => c0
		);	 
	
	FULL_ADDER1 : scheme
		port map (
		A => A4(1),
		B => B4(1),
		C_IN => c0,
		S => SUM4(1),
		C_OUT => c1
		);
	
	FULL_ADDER2 : scheme
		port map (
		A => A4(2),
		B => B4(2),
		C_IN => c1,
		S => SUM4(2),
		C_OUT => c2
		);
	
	FULL_ADDER3 : scheme
		port map (
		A => A4(3),
		B => B4(3),
		C_IN => c2,
		S => SUM4(3),
		C_OUT => C_OUT4
		);

end architecture BEHAVIORAL;
