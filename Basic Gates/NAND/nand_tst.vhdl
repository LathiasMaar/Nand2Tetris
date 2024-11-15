------------------------------------------------------------------------
-- Testbench for the NAND gate
-- |  A  |  B  |  Q  |
-- | --- | --- | --- |
-- |  0  |  0  |  1  |
-- |  0  |  1  |  1  |
-- |  1  |  0  |  1  |
-- |  1  |  1  |  0  |
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Test_Nand is
end Test_Nand;
------------------------------------------------------------------------
architecture behaviour of Test_Nand is

    signal a, b, y: std_logic;

    component Nand2
        PORT(
            a,b: IN std_logic;
            y: OUT std_logic);
    end component;

begin
    -- Create the instance to the Nand2 component (the test unit)
    uut: Nand2 PORT MAP (
        a => a,
        b => b,
        y => y
    );

    test_process: PROCESS
    begin
        -- First combination a = 0, b = 0
        a <= '0';
        b <= '0';
        WAIT FOR 10 ns;
        assert (y = '1') report "Error: a=0, b=0, y should be 1" severity error;

        -- Second combination a = 0, b = 1
        a <= '0';
        b <= '1';
        WAIT FOR 10 ns;
        assert (y = '1') report "Error: a=0, b=1, y should be 1" severity error;

        -- Third combination a = 1, b = 0
        a <= '1';
        b <= '0';
        WAIT FOR 10 ns;
        assert (y = '1') report "Error: a=1, b=0, y should be 1" severity error;

        -- Fourth combination a = 1, b = 1
        a <= '1';
        b <= '1';
        WAIT FOR 10 ns;
        assert (y = '0') report "Error: a=1, b=1, y should be 0" severity error;

        -- Test completed
        report "Test completed successfully!" severity note;

        WAIT;
    END PROCESS;

end behaviour;
------------------------------------------------------------------------