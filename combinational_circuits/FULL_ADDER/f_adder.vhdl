-------------------------------------------------------------------------------------------
--    ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄     ▄▄▄        ▄▄▄▄▄▄▄ ▄▄▄▄▄▄  ▄▄▄▄▄▄  ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   
--   █       █  █ █  █   █   █   █      █       █      ██      ██       █   ▄  █  
--   █    ▄▄▄█  █ █  █   █   █   █      █   ▄   █  ▄    █  ▄    █    ▄▄▄█  █ █ █  
--   █   █▄▄▄█  █▄█  █   █   █   █      █  █▄█  █ █ █   █ █ █   █   █▄▄▄█   █▄▄█▄ 
--   █    ▄▄▄█       █   █▄▄▄█   █▄▄▄   █       █ █▄█   █ █▄█   █    ▄▄▄█    ▄▄  █
--   █   █   █       █       █       █  █   ▄   █       █       █   █▄▄▄█   █  █ █
--   █▄▄▄█   █▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█  █▄▄█ █▄▄█▄▄▄▄▄▄██▄▄▄▄▄▄██▄▄▄▄▄▄▄█▄▄▄█  █▄█
-- ________________________________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a full_adder circuit
--
-- @components. Xor2 gates, And2 gates, Or2 gates
--
-- @function. if ((a xor b) xor c) = 1:         
--                sum = 1;                        
--            else:                                        
--                sum = 0;                            
--                                                          
--            if ((a xor b) and c) or (a and b):                    
--                car = 1;                        
--            else :                      
--                car = 0;
--
-- @truth_table.
--      _____________________________
--    /|  A  |  B  |  C  | SUM | CAR |
--   | | --- | --- | --- | --- | --- |          Inputs                Outputs
--   | |  0  |  0  |  0  |  0  |  0  |                   ___________
--   | |  1  |  0  |  0  |  1  |  0  |             A ---|           \           
--   | |  0  |  1  |  0  |  1  |  0  |             B ---|  F_ADDER  |-- Sum 
--   | |  1  |  1  |  0  |  0  |  1  |             C ---|___________|-- Car 
--   | |  0  |  0  |  1  |  1  |  0  |
--   | |  1  |  0  |  1  |  0  |  1  |
--   | |  0  |  1  |  1  |  0  |  1  |
--   | |  1  |  1  |  1  |  1  |  1  | 
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
-------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
-------------------------------------------------------------------------------------------
entity FullAdder is
    PORT(
        a, b, c : IN std_logic;
        sum, car : OUT std_logic
    );
end FullAdder;
-------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------