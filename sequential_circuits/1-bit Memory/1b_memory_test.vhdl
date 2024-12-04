------------------------------------------------------------------------
-- Testbench for the 1-bit memory:
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_b1memory is
end Test_b1memory;
------------------------------------------------------------------------
architecture test of Test_b1memory is

    signal data, load, clk, Q: std_logic;
    signal expected: std_logic;

    component b1memory
        Port (
            data, load, clk: IN std_logic;
            Q: OUT std_logic
        );
    end component;

begin
    -- Create the instance of the b1memory component (the test unit)
    uut: b1memory PORT MAP (
        data => data,
        load => load,
        clk => clk,
        Q => Q
    );

    test_process: PROCESS
        variable test_passed: boolean := true;

    begin
        -- Initial setup
        data <= '0';
        load <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';

        -- Test1: load = 0, data = 0, expect Q to remain 0
        data <= '0';
        load <= '0';

        -- Apply clock pulse
        WAIT FOR 10 ns;
        clk <= '1';
        expected <= '0';
        WAIT FOR 10 ns;
        clk <= '0';

        WAIT FOR 5 ns;
        if (Q /= '0') then
            report "Error: Test1 expected Q=0" severity error;
            test_passed := false;
        end if;

        -- Test2: load = 1, data = 1, expect Q to update to 1
        data <= '1';
        load <= '1';

        -- Apply clock pulse
        WAIT FOR 10 ns;
        clk <= '1';
        expected <= '1';
        WAIT FOR 10 ns;
        clk <= '0';

        WAIT FOR 5 ns;
        if (Q /= '1') then
            report "Error: Test2 expected Q=1" severity error;
            test_passed := false;
        end if;

        -- Test3: load = 0, data = 0, expect Q to remain 1
        data <= '0';
        load <= '0';

        -- Apply clock pulse
        WAIT FOR 10 ns;
        clk <= '1';
        expected <= '1';
        WAIT FOR 10 ns;
        clk <= '0';

        WAIT FOR 5 ns;
        if (Q /= '1') then
            report "Error: Test3 expected Q=1" severity error;
            test_passed := false;
        end if;

        -- Test4: load = 1, data = 0, expect Q to update to 0
        data <= '0';
        load <= '1';

        -- Apply clock pulse
        WAIT FOR 10 ns;
        clk <= '1'; 
        expected <= '0';
        WAIT FOR 10 ns;
        clk <= '0';

        WAIT FOR 5 ns;
        if (Q /= '0') then
            report "Error: Test4 expected Q=0" severity error;
            test_passed := false;
        end if;

        -- Test5: Verify no update on data change when load = 0
        data <= '1';
        load <= '0';

        -- Apply clock pulse
        WAIT FOR 10 ns; 
        clk <= '1'; 
        expected <= '0';
        WAIT FOR 10 ns;
        clk <= '0';

        WAIT FOR 5 ns;
        if (Q /= '0') then
            report "Error: Test5 expected Q=0 without clock" severity error;
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
