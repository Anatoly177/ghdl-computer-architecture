library IEEE;
    use IEEE.STD_LOGIC_1164.all;

    use std.textio.all;
    use work.txt_util.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_adder4 is
    generic (runner_cfg : string);
end tb_adder4;

architecture BEHAVIORAL of tb_adder4 is
	component adder4
		port (
            A4 : in std_logic_vector(3 downto 0);
            B4 : in std_logic_vector(3 downto 0);
            SUM4 : out std_logic_vector(3 downto 0);
            C_OUT4 : out std_logic
		);
	end component;
	
	signal sig_a4 : std_logic_vector(3 downto 0);
	signal sig_b4 : std_logic_vector(3 downto 0);
	
	signal sig_sum4 : std_logic_vector(3 downto 0); 
	signal sig_c_out : std_logic;

    begin
        -- Unit Under Test (UUT)
        uut: ADDER4 port map (
            A4 => sig_a4,
            B4 => sig_b4,
            SUM4 => sig_sum4,
            C_OUT4 => sig_c_out
        );
	  
        -- Stimulus process
        TEST: process
            begin
            test_runner_setup(runner, runner_cfg);
                    sig_a4 <= "0000";
                    sig_b4 <= "0000";

                    wait for 10 ns;
                    report "SUM: " & hstr(sig_sum4);
                    report "C_OUT " & str(sig_c_out);
                    report "A: " & hstr(sig_a4);
                    report "B: " & hstr(sig_b4);

                    sig_a4 <= "0110";
                    sig_b4 <= "1100";

                    wait for 10 ns;
                    report "SUM: " & hstr(sig_sum4);
                    report "C_OUT " & str(sig_c_out);
                    report "A: " & hstr(sig_a4);
                    report "B: " & hstr(sig_b4);

                    sig_a4 <= "1111";
                    sig_b4 <= "1100";

                    wait for 10 ns;
                    report "SUM: " & hstr(sig_sum4);
                    report "C_OUT " & str(sig_c_out);
                    report "A: " & hstr(sig_a4);
                    report "B: " & hstr(sig_b4);

                    sig_a4 <= "0110";
                    sig_b4 <= "0111";

                    wait for 10 ns;
                    report "SUM: " & hstr(sig_sum4);
                    report "C_OUT " & str(sig_c_out);
                    report "A: " & hstr(sig_a4);
                    report "B: " & hstr(sig_b4);

                    sig_a4 <= "0110";
                    sig_b4 <= "1110";

                    wait for 10 ns;
                    report "SUM: " & hstr(sig_sum4);
                    report "C_OUT " & str(sig_c_out);
                    report "A: " & hstr(sig_a4);
                    report "B: " & hstr(sig_b4);

                    sig_a4 <= "1111";
                    sig_b4 <= "1111";
            
                    wait for 10 ns;
                    report "SUM: " & hstr(sig_sum4);
                    report "C_OUT " & str(sig_c_out);
                    report "A: " & hstr(sig_a4);
                    report "B: " & hstr(sig_b4);
            test_runner_cleanup(runner); -- Simulation ends here
            wait;
        end process TEST;
end BEHAVIORAL;