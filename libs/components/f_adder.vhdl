--------------------------------------------------------------------------------
-- Implementation of the FULL_ADDER circuit.
--      _____________________________
--    /|  A  |  B  |  C  | SUM | CAR |
--   | | --- | --- | --- | --- | --- | 
--   | |  0  |  0  |  0  |  0  |  0  |
--   | |  1  |  0  |  0  |  1  |  0  |
--   | |  0  |  1  |  0  |  1  |  0  |
--   | |  1  |  1  |  0  |  0  |  1  | 
--   | |  0  |  0  |  1  |  1  |  0  |
--   | |  1  |  0  |  1  |  0  |  1  |
--   | |  0  |  1  |  1  |  0  |  1  |
--   | |  1  |  1  |  1  |  1  |  1  | 
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
-- Inputs: a (in1), b (in2), c (prev carried)
-- Outputs: sum, car
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
--------------------------------------------------------------------------------
entity FullAdder is
    PORT(
        a, b, c : IN std_logic;
        sum, car : OUT std_logic
    );
end FullAdder;
--------------------------------------------------------------------------------
architecture structure of FullAdder is

    signal a_sum_b, car1, car2: std_logic;
    
    component Xor2 is
        PORT(
            a,b : IN std_logic;
            y : OUT std_logic
        );   
    end component;

    component Or2 is
        PORT(
            a,b : IN std_logic;
            y : OUT std_logic
        );   
    end component;

    component And2
        PORT(
            a,b : IN std_logic;
            y : OUT std_logic);
    end component;

    begin
        U1: Xor2 PORT map(
            a => a,
            b => b,
            y => a_sum_b    
        );

        U2: Xor2 PORT map(
            a => a_sum_b,
            b => c,
            y => sum     
        );

        U3: And2 PORT map(
            a => a_sum_b,
            b => c,
            y => car1  
        );

        U4: And2 PORT map(
            a => a,
            b => b,
            y => car2  
        );

        U5: Or2 PORT map(
            a => car1,
            b => car2,
            y => car  
        );
end structure;