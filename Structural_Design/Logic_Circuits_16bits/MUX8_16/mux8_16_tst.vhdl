------------------------------------------------------------------------
-- Testbench for the Mux2_16:
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_Mux8_16 is
end Test_Mux8_16;
------------------------------------------------------------------------
architecture test of Test_Mux8_16 is

    signal a, b, c, d, e, f, g, h, y: std_logic_vector(15 downto 0);
    signal s1, s2, s3: std_logic;

    component Mux8_16 is
        Port (
            a, b, c, d, e, f, g, h: IN std_logic_vector(15 downto 0);
            s1, s2, s3: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
    -- Create the instance to the Mux2 component (the test unit)
    uut: Mux8_16 PORT MAP (
        a => a,
        b => b,
        c => c,
        d => d,
        e => e,
        f => f,
        g => g,
        h => h,
        s1 => s1,
        s2 => s2,
        s3 => s3,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a = 0003, b = 000C, c=0030, d=00C0, e=0300, f=0C00, g=3000, h=C000 s=0
        a <= "0000000000000011";
        b <= "0000000000001100";
        c <= "0000000000110000";
        d <= "0000000011000000";
        e <= "0000001100000000";
        f <= "0000110000000000";
        g <= "0011000000000000";
        h <= "1100000000000000";
        s1 <= '0'; s2 <= '0'; s3 <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: Test 1 result expected y=000F" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a=0003, b=000C, c=0030, d=00C0, e=0300, f=0C00, g=3000, h=C000 s=1
        a <= "0000000000000011";
        b <= "0000000000001100";
        c <= "0000000000110000";
        d <= "0000000011000000";
        e <= "0000001100000000";
        f <= "0000110000000000";
        g <= "0011000000000000";
        h <= "1100000000000000";
        s1 <= '1'; s2 <= '0'; s3 <= '0';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: Test 2 result expected y=00F0" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a=0003, b=000C, c=0030, d=00C0, e=0300, f=0C00, g=3000, h=C000 s=2
        a <= "0000000000000011";
        b <= "0000000000001100";
        c <= "0000000000110000";
        d <= "0000000011000000";
        e <= "0000001100000000";
        f <= "0000110000000000";
        g <= "0011000000000000";
        h <= "1100000000000000";
        s1 <= '0'; s2 <= '1'; s3 <= '0';
        WAIT FOR 10 ns;
        if (y /= c) then
            report "Error: Test 3 result expected y=00FF" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a=0003, b=000C, c=0030, d=00C0, e=0300, f=0C00, g=3000, h=C000 s=3
        a <= "0000000000000011";
        b <= "0000000000001100";
        c <= "0000000000110000";
        d <= "0000000011000000";
        e <= "0000001100000000";
        f <= "0000110000000000";
        g <= "0011000000000000";
        h <= "1100000000000000";
        s1 <= '1'; s2 <= '1'; s3 <= '0';
        WAIT FOR 10 ns;
        if (y /= d) then
            report "Error: Test 4 result expected y=0F00" severity error;
            test_passed := false;
        end if;

        -- Test 5: combination a=0003, b=000C, c=0030, d=00C0, e=0300, f=0C00, g=3000, h=C000 s=4
        a <= "0000000000000011";
        b <= "0000000000001100";
        c <= "0000000000110000";
        d <= "0000000011000000";
        e <= "0000001100000000";
        f <= "0000110000000000";
        g <= "0011000000000000";
        h <= "1100000000000000";
        s1 <= '0'; s2 <= '0'; s3 <= '1';
        WAIT FOR 10 ns;
        if (y /= e) then
            report "Error: Test 5 result expected y=0F0F" severity error;
            test_passed := false;
        end if;

        -- Test 6: combination a=0003, b=000C, c=0030, d=00C0, e=0300, f=0C00, g=3000, h=C000 s=5
        a <= "0000000000000011";
        b <= "0000000000001100";
        c <= "0000000000110000";
        d <= "0000000011000000";
        e <= "0000001100000000";
        f <= "0000110000000000";
        g <= "0011000000000000";
        h <= "1100000000000000";
        s1 <= '1'; s2 <= '0'; s3 <= '1';
        WAIT FOR 10 ns;
        if (y /= f) then
            report "Error: Test 6 result expected y=0FF0" severity error;
            test_passed := false;
        end if;

        -- Test 7: combination a=0003, b=000C, c=0030, d=00C0, e=0300, f=0C00, g=3000, h=C000 s=6
        a <= "0000000000000011";
        b <= "0000000000001100";
        c <= "0000000000110000";
        d <= "0000000011000000";
        e <= "0000001100000000";
        f <= "0000110000000000";
        g <= "0011000000000000";
        h <= "1100000000000000";
        s1 <= '0'; s2 <= '1'; s3 <= '1';
        WAIT FOR 10 ns;
        if (y /= g) then
            report "Error: Test 7 result expected y=F000" severity error;
            test_passed := false;
        end if;

        -- Test 8: combination a=0003, b=000C, c=0030, d=00C0, e=0300, f=0C00, g=3000, h=C000 s=7
        a <= "0000000000000011";
        b <= "0000000000001100";
        c <= "0000000000110000";
        d <= "0000000011000000";
        e <= "0000001100000000";
        f <= "0000110000000000";
        g <= "0011000000000000";
        h <= "1100000000000000";
        s1 <= '1'; s2 <= '1'; s3 <= '1';
        WAIT FOR 10 ns;
        if (y /= h) then
            report "Error: Test 8 result expected y=F00F" severity error;
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