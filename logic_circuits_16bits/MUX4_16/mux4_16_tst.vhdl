------------------------------------------------------------------------
-- Testbench for the Mux2_16:
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_Mux4_16 is
end Test_Mux4_16;
------------------------------------------------------------------------
architecture test of Test_Mux4_16 is

    signal a, b, c, d, y: std_logic_vector(15 downto 0);
    signal s1, s2: std_logic;

    component Mux4_16 is
        Port (
            a, b, c, d: IN std_logic_vector(15 downto 0);
            s1, s2: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
    -- Create the instance to the Mux2 component (the test unit)
    uut: Mux4_16 PORT MAP (
        a => a,
        b => b,
        c => c,
        d => d,
        s1 => s1,
        s2 => s2,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a = 000F, b = 00F0, b = 0F00, b = F000, s=0
        a <= "0000000000001111";
        b <= "0000000011110000";
        c <= "0000111100000000";
        d <= "1111000000000000";
        s1 <= '0'; s2 <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: for a=0000, b=FFFF, c=00FF, d=FF00 and s=0, result expected y=0000" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a = 000F, b = 00F0, b = 0F00, b = F000, s=1
        a <= "0000000000001111";
        b <= "0000000011110000";
        c <= "0000111100000000";
        d <= "1111000000000000";
        s1 <= '1'; s2 <= '0';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: for a=0000, b=FFFF, c=00FF, d=FF00 and s=1, result expected y=FFFF" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a = 000F, b = 00F0, b = 0F00, b = F000, s=2
        a <= "0000000000001111";
        b <= "0000000011110000";
        c <= "0000111100000000";
        d <= "1111000000000000";
        s1 <= '0'; s2 <= '1';
        WAIT FOR 10 ns;
        if (y /= c) then
            report "Error: for a=0000, b=FFFF, c=00FF, d=FF00 and s=2, result expected y=00FF" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a = 000F, b = 00F0, b = 0F00, b = F000, s=3
        a <= "0000000000001111";
        b <= "0000000011110000";
        c <= "0000111100000000";
        d <= "1111000000000000";
        s1 <= '1'; s2 <= '1';
        WAIT FOR 10 ns;
        if (y /= d) then
            report "Error: for a=0000, b=FFFF, c=00FF, d=FF00 and s=3, result expected y=FF00" severity error;
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