library IEEE;
    use IEEE.STD_LOGIC_1164.all;

    use std.textio.all;
    use work.txt_util.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_scheme is
    generic (runner_cfg : string);
end tb_scheme;

architecture BEHAVIORAL of tb_scheme is
	component scheme
		port (
			A : in std_logic;
			B : in std_logic;
            C_IN : in std_logic;
            S : out std_logic;
            C_OUT : out std_logic
		);
	end component;
	
	signal sig_a : std_logic := '1';
    signal sig_b : std_logic := '1';
    signal sig_c : std_logic := '0';
	
	signal sig_sum, sig_c_out : std_logic; 

    begin
        -- Unit Under Test (UUT)
        uut: scheme port map (
            A => sig_a,
            B => sig_b,
            C_IN => sig_c,
            S => sig_sum,
            C_OUT => sig_c_out
        );
	  
        -- Stimulus process
        main: process
            begin
            test_runner_setup(runner, runner_cfg);
                report "SUM: " & str(sig_sum);
                report "C_OUT " & str(sig_c_out);
                report "A: " & str(sig_a);
                report "B: " & str(sig_b);
                report "C_IN:" & str(sig_c);
            test_runner_cleanup(runner); -- Simulation ends here
        end process;
end BEHAVIORAL;