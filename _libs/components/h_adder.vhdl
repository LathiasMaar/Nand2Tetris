--------------------------------------------------------------------------------
-- Implementation of the HALF_ADDER circuit.
--      _______________________
--     |  A  |  B  | SUM | CAR |
--     | --- | --- | --- | --- | 
--     |  0  |  0  |  0  |  0  |
--     |  1  |  0  |  1  |  0  |
--     |  0  |  1  |  1  |  0  |
--     |  1  |  1  |  0  |  1 | 
--      ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
-- Inputs: a, b
-- Outputs: sum, car
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
--------------------------------------------------------------------------------
entity HalfAdder is
    PORT(
        a, b : IN std_logic;
        sum, car : OUT std_logic
    );
end HalfAdder;
--------------------------------------------------------------------------------
architecture structure of HalfAdder is

    component Xor2 is
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
            y => sum     
        );

        U2: And2 PORT map(
            a => a,
            b => b,
            y => car  
        );
end structure;