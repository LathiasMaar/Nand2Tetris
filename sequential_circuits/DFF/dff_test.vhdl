------------------------------------------------------------------------
-- Testbench for the DFF:
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_DFF is
end Test_DFF;
------------------------------------------------------------------------
architecture test of Test_DFF is

    signal d, clk, Q, Qn: std_logic;

    component DFF
        PORT(
            d, clk: IN std_logic;
            Q, Qn: OUT std_logic
        );
    end component;

begin
    -- Create the instance of the DFF component (the test unit)
    uut: DFF PORT MAP (
        d => d,
        clk => clk,
        Q => Q,
        Qn => Qn
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Initial setup
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';  -- Ensure initial clock pulse

        -- Test1: D = 0, expect Q = 0, Qn = 1
        d <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        if (Q /= '0' or Qn /= '1') then
            report "Error: Test1 expected Q=0, Qn=1" severity error;
            test_passed := false;
        end if;

        -- Test2: D = 1, expect Q = 1, Qn = 0
        d <= '1';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        if (Q /= '1' or Qn /= '0') then
            report "Error: Test2 expected Q=1, Qn=0" severity error;
            test_passed := false;
        end if;

        -- Test3: D = 0, expect Q = 0, Qn = 1
        d <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        if (Q /= '0' or Qn /= '1') then
            report "Error: Test3 expected Q=0, Qn=1" severity error;
            test_passed := false;
        end if;

        -- Test4: Verify that changes in 'd' do not affect 'Q' and 'Qn' between clock pulses
        -- Initial state: D = 0, expect Q = 0, Qn = 1 after clock pulse
        d <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        if (Q /= '0' or Qn /= '1') then
            report "Error: Initial state failed. Expected Q=0, Qn=1" severity error;
            test_passed := false;
        end if;

        -- Change D while clk is low, Q and Qn should remain unchanged
        d <= '1';
        WAIT FOR 10 ns;  -- No clock pulse, values should not change
        if (Q /= '0' or Qn /= '1') then
            report "Error: Q or Qn changed without clock pulse" severity error;
            test_passed := false;
        end if;

        -- Apply clock pulse to capture new D value
        clk <= '1';
        WAIT FOR 10 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        if (Q /= '1' or Qn /= '0') then
            report "Error: Test4 expected Q=1, Qn=0 after clock pulse" severity error;
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
