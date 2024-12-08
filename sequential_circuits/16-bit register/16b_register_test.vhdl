------------------------------------------------------------------------
-- Testbench for the b16register:
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_b16register is
end Test_b16register;
------------------------------------------------------------------------
architecture test of Test_b16register is

    signal data: std_logic_vector(15 downto 0);
    signal load, clk: std_logic;
    signal Q: std_logic_vector(15 downto 0);

    component b16register
        Port (
            data: IN std_logic_vector(15 downto 0);
            load: IN std_logic;
            clk: IN std_logic;
            Q: OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
    -- Create the instance of the b16register component (the test unit)
    uut: b16register PORT MAP (
        data => data,
        load => load,
        clk => clk,
        Q => Q
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Initial setup
        data <= (others => '0');
        load <= '0';
        clk <= '0';
        WAIT FOR 10 ns;

        -- Test1: Write data with load=1, check if Q updates
        data <= "0000000000001010";  -- Binary for 10
        load <= '1';
        clk <= '1';
        WAIT FOR 10 ns;
        clk <= '0';
        WAIT FOR 10 ns;
        if Q /= "0000000000001010" then
            report "Error: Test1 failed. Expected Q=0000000000001010" severity error;
            test_passed := false;
        end if;

        -- Test2: Change data with load=0, Q should not change
        data <= "1111111111111111";
        load <= '0';
        clk <= '1';
        WAIT FOR 10 ns;
        clk <= '0';
        WAIT FOR 10 ns;
        if Q /= "0000000000001010" then
            report "Error: Test2 failed. Q should remain 0000000000001010" severity error;
            test_passed := false;
        end if;

        -- Test3: Write new data with load=1
        data <= "1010101010101010";  -- Binary pattern
        load <= '1';
        clk <= '1';
        WAIT FOR 10 ns;
        clk <= '0';
        WAIT FOR 10 ns;
        if Q /= "1010101010101010" then
            report "Error: Test3 failed. Expected Q=1010101010101010" severity error;
            test_passed := false;
        end if;

        -- Test completed
        if test_passed then
            report "All tests completed successfully!" severity note;
        end if;

        WAIT;
    END PROCESS;

end test;
------------------------------------------------------------------------