------------------------------------------------------------------------
-- Testbench for the Half_Adder:
-- |  A  |  B  | Sum | Car | 
-- | --- | --- | --- | --- | 
-- |  0  |  0  |  0  |  0  |
-- |  0  |  1  |  1  |  0  |
-- |  1  |  0  |  1  |  0  |
-- |  1  |  1  |  0  |  1  |
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_HalfAdder is
end Test_HalfAdder;
------------------------------------------------------------------------
architecture test of Test_HalfAdder is

    signal a, b, sum, car: std_logic;

    component HalfAdder
        PORT(
            a, b: IN std_logic;
            sum, car: OUT std_logic);
    end component;

begin
    -- Create the instance to the HalfAdder component (the test unit)
    uut: HalfAdder PORT MAP (
        a => a,
        b => b,
        sum => sum,
        car => car
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a = 0, b = 0
        a <= '0';
        b <= '0';
        WAIT FOR 10 ns;
        if (sum /= '0' and car /= '0') then
            report "Error: Test 1 result expected sum=0 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a = 0, b = 1
        a <= '0';
        b <= '1';
        WAIT FOR 10 ns;
        if (sum /= '1' and car /= '0') then
            report "Error: Test 2 result expected sum=1 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a = 1, b = 0
        a <= '1';
        b <= '0';
        WAIT FOR 10 ns;
        if (sum /= '1' and car /= '0') then
            report "Error: Test 3 result expected sum=1 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a = 1, b = 1
        a <= '1';
        b <= '1';
        WAIT FOR 10 ns;
        if (sum /= '0' and car /= '1') then
            report "Error: Test 4 result expected sum=1 and car=1" severity error;
            test_passed := false;
        end if;

        -- Test completed
        if test_passed then
            report "Test completed successfully!" severity note;
        end if;

        WAIT;
    END PROCESS;

end test;
------------------------------------------------------------------------