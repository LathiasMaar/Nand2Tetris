------------------------------------------------------------------------
-- Testbench for the NOT16 gate
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Test_Not16 is
end Test_Not16;
------------------------------------------------------------------------
architecture test of Test_Not16 is

    signal a, y: std_logic_vector(15 downto 0);

    component Not16
        PORT(
            a: IN std_logic_vector(15 downto 0);
            y: OUT std_logic_vector(15 downto 0));
    end component;

begin
    -- Create the instance to the Nand2 component (the test unit)
    uut: Not16 PORT MAP (
        a => a,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin

        -- Test 1: All zeros
        a <= "0000000000000000";
        WAIT FOR 10 ns;
        if (y /= "1111111111111111") then
            report "Error: Test1 expected result is y=1111" severity error;
            test_passed := false;
        end if;

        -- Test 2: All ones
        a <= "1111111111111111";
        WAIT FOR 10 ns;
        if (y /= "0000000000000000") then
            report "Error: Test2 expected result is y=0000" severity error;
            test_passed := false;
        end if;

         -- Test 3: Alternate
         a <= "0101010101010101";
         WAIT FOR 10 ns;
         if (y /= "1010101010101010") then
             report "Error: Test3 expected result is y=AAAA" severity error;
             test_passed := false;
         end if;

         -- Test 4: a = 0F0F
         a <= "0000111100001111";
         WAIT FOR 10 ns;
         if (y /= "1111000011110000") then
             report "Error: Test4 expected result is y=F0F0" severity error;
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