------------------------------------------------------------------------
-- Testbench for the OR16 gate
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Test_Or16 is
end Test_Or16;
------------------------------------------------------------------------
architecture test of Test_Or16 is

    signal a, b, y: std_logic_vector(15 downto 0);

    component Or16
        PORT(
            a,b: IN std_logic_vector(15 downto 0);
            y: OUT std_logic_vector(15 downto 0));
    end component;

begin
    -- Create the instance to the And16 component (the test unit)
    uut: Or16 PORT MAP (
        a => a,
        b => b,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin

        -- Test 1: a = 0F0F, b = 00FF
        a <= "0000111100001111";
        b <= "0000000011111111";
        WAIT FOR 10 ns;
        if (y /= "0000111111111111") then
            report "Error: Test1 expected result is y=0FFF" severity error;
            test_passed := false;
        end if;

        -- Test 2: a = 5555, b = 5555
        a <= "0101010101010101";
        b <= "0101010101010101";
        WAIT FOR 10 ns;
        if (y /= "0101010101010101") then
            report "Error: Test2 expected result is y=5555" severity error;
            test_passed := false;
        end if;

        -- Test 3: a = 5555, b = AAAA
        a <= "0101010101010101";
        b <= "1010101010101010";
        WAIT FOR 10 ns;
        if (y /= "1111111111111111") then
            report "Error: Test3 expected result is y=FFFF" severity error;
            test_passed := false;
        end if;

        -- Test 4: a = 00FF, b = 5555
        a <= "0000000011111111";
        b <= "1010101010101010";
        WAIT FOR 10 ns;
        if (y /= "1010101011111111") then
            report "Error: Test4 expected result is y=155FF" severity error;
            test_passed := false;
        end if;

        -- Test 5: a = 5555, b = FFFF
        a <= "0101010101010101";
        b <= "1111111111111111";
        WAIT FOR 10 ns;
        if (y /= "1111111111111111") then
            report "Error: Test5 expected result is y=FFFF" severity error;
            test_passed := false;
        end if;

        -- Test 6: a = 5555, b = 0000
        a <= "0101010101010101";
        b <= "0000000000000000";
        WAIT FOR 10 ns;
        if (y /= "0101010101010101") then
            report "Error: Test6 expected result is y=0000" severity error;
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