------------------------------------------------------------------------
-- Testbench for the NOT gate
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
            report "Error: a=0000000000000000, expected y=1111111111111111" severity error;
            test_passed := false;
        end if;

        -- Test 2: All ones
        a <= "1111111111111111";
        WAIT FOR 10 ns;
        if (y /= "0000000000000000") then
            report "Error: a=1111111111111111, y should be 0000000000000000" severity error;
            test_passed := false;
        end if;

         -- Test 3: Alternate
         a <= "0101010101010101";
         WAIT FOR 10 ns;
         if (y /= "1010101010101010") then
             report "Error: a=0101010101010101, y should be 1010101010101010" severity error;
             test_passed := false;
         end if;

         -- Test 4: a = 0000111100001111
         a <= "0000111100001111";
         WAIT FOR 10 ns;
         if (y /= "1111000011110000") then
             report "Error: a=0000111100001111, y should be 1111000011110000" severity error;
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