------------------------------------------------------------------------
-- Testbench for the Mux2_16:
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_Mux2_16 is
end Test_Mux2_16;
------------------------------------------------------------------------
architecture test of Test_Mux2_16 is

    signal a, b, y: std_logic_vector(15 downto 0);
    signal s: std_logic;

    component Mux2_16 is
        Port (
            a, b: IN std_logic_vector(15 downto 0);
            s: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
    -- Create the instance to the Mux2 component (the test unit)
    uut: Mux2_16 PORT MAP (
        a => a,
        b => b,
        s => s,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a = 0000, b = FFFF, s=0
        a <= "0000000000000000";
        b <= "1111111111111111";
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: for a=0000, b=FFFF and s=0, result expected y=0000" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a = 0000, b = FFFF, s=1
        a <= "0000000000000000";
        b <= "1111111111111111";
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: for a=0000, b=FFFF and s=0, result expected y=0000" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a = 00FF, b = FF00, s=0
        a <= "0000000011111111";
        b <= "1111111100000000";
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: for a=00FF, b=FF00 and s=0, result expected y=00FF" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a = 0000, b = FFFF, s=0
        a <= "0000000011111111";
        b <= "1111111100000000";
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: for a=00FF, b=FF00 and s=0, result expected y=FF00" severity error;
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