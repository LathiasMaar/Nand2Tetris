-------------------------------------------------------------------------------------------
--    ▄▄▄▄▄▄▄ ▄▄▄▄▄▄  ▄▄▄▄▄▄  ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   ▄▄▄▄ ▄▄▄     
--   █       █      ██      ██       █   ▄  █ █    █   █    
--   █   ▄   █  ▄    █  ▄    █    ▄▄▄█  █ █ █  █   █   █▄▄▄ 
--   █  █▄█  █ █ █   █ █ █   █   █▄▄▄█   █▄▄█▄ █   █    ▄  █
--   █       █ █▄█   █ █▄█   █    ▄▄▄█    ▄▄  ██   █   █ █ █
--   █   ▄   █       █       █   █▄▄▄█   █  █ ██   █   █▄█ █
--   █▄▄█ █▄▄█▄▄▄▄▄▄██▄▄▄▄▄▄██▄▄▄▄▄▄▄█▄▄▄█  █▄██▄▄▄█▄▄▄▄▄▄▄█
-- ________________________________________________________________________________________
-- @author. LathiasMaar
-- @brief. Implementation of the 16 bits ADDER circuit. Adds the value of 2 16-bits numbers
-- and carries out the bit of the most significant bit operation.
--
-- @components. Full-Adder circuits
--
-- @function. if ((a[n] xor b[n]) xor c[n]) = 1:         
--                sum[n] = 1;                        
--            else:                                        
--                sum[n] = 0;                            
--                                                          
--            if ((a[n] xor b[n]) and c[n]) or (a[n] and b[n]):                    
--                car = 1;                        
--            else :                      
--                car = 0;
--
-- @truth_table.
--      _______________________________
--    /| A[n]| B[n]| C[n]|SUM[n]|CAR[n]|
--   | | --- | --- | --- | ---- | ---- |          Inputs                Outputs
--   | |  0  |  0  |  0  |  0   |  0   |                     _________
--   | |  1  |  0  |  0  |  1   |  0   |            A[n] ---|           \           
--   | |  0  |  1  |  0  |  1   |  0   |            B[n] ---|  F_ADDER  |-- Sum[n]
--   | |  1  |  1  |  0  |  0   |  1   |               C ---|___________|-- Car 
--   | |  0  |  0  |  1  |  1   |  0   |
--   | |  1  |  0  |  1  |  0   |  1   |
--   | |  0  |  1  |  1  |  0   |  1   |
--   | |  1  |  1  |  1  |  1   |  1   | 
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
-------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
--------------------------------------------------------------------------------
entity Adder16 is
    PORT(
        a, b : IN std_logic_vector(15 downto 0);
        c: IN std_logic;
        sum: OUT std_logic_vector(15 downto 0);
        car : OUT std_logic
    );
end Adder16;
--------------------------------------------------------------------------------
architecture structure of Adder16 is

    signal car1, car2, car3, car4, car5, car6, car7, car8, car9, car10, car11, car12, car13, car14, car15: std_logic;
    
    component FullAdder is
        PORT(
            a,b,c : IN std_logic;
            sum, car : OUT std_logic
        );   
    end component;

    begin
        U1: FullAdder PORT map(
            a => a(0),
            b => b(0),
            c => c,
            sum => sum(0),
            car => car1    
        );

        U2: FullAdder PORT map(
            a => a(1),
            b => b(1),
            c => car1,
            sum => sum(1),
            car => car2    
        );

        U3: FullAdder PORT map(
            a => a(2),
            b => b(2),
            c => car2,
            sum => sum(2),
            car => car3    
        );

        U4: FullAdder PORT map(
            a => a(3),
            b => b(3),
            c => car3,
            sum => sum(3),
            car => car4    
        );

        U5: FullAdder PORT map(
            a => a(4),
            b => b(4),
            c => car4,
            sum => sum(4),
            car => car5    
        );

        U6: FullAdder PORT map(
            a => a(5),
            b => b(5),
            c => car5,
            sum => sum(5),
            car => car6    
        );

        U7: FullAdder PORT map(
            a => a(6),
            b => b(6),
            c => car6,
            sum => sum(6),
            car => car7    
        );

        U8: FullAdder PORT map(
            a => a(7),
            b => b(7),
            c => car7,
            sum => sum(7),
            car => car8    
        );

        U9: FullAdder PORT map(
            a => a(8),
            b => b(8),
            c => car8,
            sum => sum(8),
            car => car9    
        );

        U10: FullAdder PORT map(
            a => a(9),
            b => b(9),
            c => car9,
            sum => sum(9),
            car => car10    
        );

        U11: FullAdder PORT map(
            a => a(10),
            b => b(10),
            c => car10,
            sum => sum(10),
            car => car11    
        );

        U12: FullAdder PORT map(
            a => a(11),
            b => b(11),
            c => car11,
            sum => sum(11),
            car => car12    
        );

        U13: FullAdder PORT map(
            a => a(12),
            b => b(12),
            c => car12,
            sum => sum(12),
            car => car13    
        );

        U14: FullAdder PORT map(
            a => a(13),
            b => b(13),
            c => car13,
            sum => sum(13),
            car => car14    
        );

        U15: FullAdder PORT map(
            a => a(14),
            b => b(14),
            c => car14,
            sum => sum(14),
            car => car15    
        );

        U16: FullAdder PORT map(
            a => a(15),
            b => b(15),
            c => car15,
            sum => sum(15),
            car => car   
        );

end structure;
-------------------------------------------------------------------------------------------