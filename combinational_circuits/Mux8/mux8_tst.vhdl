-------------------------------------------------------------------------------------
-- Testbench for the Mux4:
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_Mux8 is
end Test_Mux8;
------------------------------------------------------------------------
architecture test of Test_Mux8 is

    signal a, b, c, d, e, f, g, h, y: std_logic;
    signal s: std_logic_vector(2 downto 0);

    component Mux8
        Port (
            a, b, c, d, e, f, g, h: IN std_logic;
            s: std_logic_vector(2 downto 0);
            y: OUT std_logic );
    end component;

begin
    -- Create the instance to the DMux4 component (the test unit)
    uut: Mux8 PORT MAP (
        a => a, b => b, c => c, d => d, e => e, f => f, g => g, h => h, s => s,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a=1, b=0, c=0, d=0, e=0, f=0, g=0, h=0, s=0
        a <= '1'; b <= '0'; c <= '0'; d <= '0';
        e <= '0'; f <= '0'; g <= '0'; h <= '0';
        s <= "000";
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: Test1 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a=0, b=1, c=0, d=0, e=0, f=0, g=0, h=0, s=1
        a <= '0'; b <= '1'; c <= '0'; d <= '0';
        e <= '0'; f <= '0'; g <= '0'; h <= '0';
        s <= "001";
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: Test2 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a=0, b=0, c=1, d=0, e=0, f=0, g=0, h=0, s=2
        a <= '0'; b <= '0'; c <= '1'; d <= '0';
        e <= '0'; f <= '0'; g <= '0'; h <= '0';
        s <= "010";
        WAIT FOR 10 ns;
        if (y /= c) then
            report "Error: Test3 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a=0, b=0, c=0, d=1, e=0, f=0, g=0, h=0, s=3
        a <= '0'; b <= '0'; c <= '0'; d <= '1';
        e <= '0'; f <= '0'; g <= '0'; h <= '0';
        s <= "011";
        WAIT FOR 10 ns;
        if (y /= d) then
            report "Error: Test4 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 5: combination a=0, b=0, c=0, d=0, e=1, f=0, g=0, h=0, s=4
        a <= '0'; b <= '0'; c <= '0'; d <= '0';
        e <= '1'; f <= '0'; g <= '0'; h <= '0';
        s <= "100";
        WAIT FOR 10 ns;
        if (y /= e) then
            report "Error: Test5 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 6: combination a=0, b=0, c=0, d=0, e=0, f=1, g=0, h=0, s=5
        a <= '0'; b <= '0'; c <= '0'; d <= '0';
        e <= '0'; f <= '1'; g <= '0'; h <= '0';
        s <= "101";
        WAIT FOR 10 ns;
        if (y /= f) then
            report "Error: Test6 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 7: combination a=0, b=0, c=0, d=0, e=0, f=0, g=1, h=0, s=6
        a <= '0'; b <= '0'; c <= '0'; d <= '0';
        e <= '0'; f <= '0'; g <= '1'; h <= '0';
        s <= "110";
        WAIT FOR 10 ns;
        if (y /= g) then
            report "Error: Test7 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 8: combination a=0, b=0, c=0, d=0, e=0, f=0, g=0, h=1, s=7
        a <= '0'; b <= '0'; c <= '0'; d <= '0';
        e <= '0'; f <= '0'; g <= '0'; h <= '1';
        s <= "111";
        WAIT FOR 10 ns;
        if (y /= h) then
            report "Error: Test8 expected results is 1" severity error;
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