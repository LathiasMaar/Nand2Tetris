------------------------------------------------------------------------
-- Implementation of the ADDER_16Bits circuit.
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_Adder16 is
end Test_Adder16;
------------------------------------------------------------------------
architecture test of Test_Adder16 is

    signal a, b, sum: std_logic_vector(15 downto 0);
    signal c, car: std_logic;

    component Adder16
        PORT(
            a, b : IN std_logic_vector(15 downto 0);
            c: IN std_logic;
            sum: OUT std_logic_vector(15 downto 0);
            car : OUT std_logic
        );
    end component;

begin
    -- Create the instance to the FullAdder component (the test unit)
    uut: Adder16 PORT MAP (
        a => a,
        b => b,
        c => c,
        sum => sum,
        car => car
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a = FF00, b = 00FF, c = 0 
        a <= "1111111100000000";
        b <= "0000000011111111";
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= "1111111111111111" and car /= '0') then
            report "Error: Test 1 result expected sum=FFFF and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a = 0000, b = 0000, c = 1 
        a <= "0000000000000000";
        b <= "0000000000000000";
        c <= '1';
        WAIT FOR 10 ns;
        if (sum /= "0000000000000001" and car /= '0') then
            report "Error: Test 2 result expected sum=0001 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a = FFFF, b = 0001, c = 0 
        a <= "1111111111111111";
        b <= "0000000000000001";
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= "0000000000000000" and car /= '1') then
            report "Error: Test 3 result expected sum=0000 and car=1" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a = AAAA, b = 5555, c = 0 
        a <= "1010101010101010";
        b <= "0101010101010101";
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= "1111111111111111" and car /= '0') then
            report "Error: Test 4 result expected sum=FFFF and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 5: combination a = 3CC3, b = 0FF0, c = 0 
        a <= "0011110011000011";
        b <= "0000111111110000";
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= "0100110010110011" and car /= '0') then
            report "Error: Test 5 result expected sum=4CB3 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 6: combination a = FFFF, b = FFFF, c = 0 
        a <= "1111111111111111";
        b <= "1111111111111111";
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= "1111111111111110" and car /= '1') then
            report "Error: Test 6 result expected sum=FFFE and car=1" severity error;
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