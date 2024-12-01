------------------------------------------------------------------------------------------
--    ▄▄   ▄▄ ▄▄   ▄▄ ▄▄   ▄▄ ▄   ▄▄▄      ▄▄▄▄ ▄▄▄     
--   █  █▄█  █  █ █  █  █▄█  █ █ █   █    █    █   █    
--   █       █  █ █  █       █ █▄█   █     █   █   █▄▄▄ 
--   █       █  █▄█  █       █       █     █   █    ▄  █
--   █       █       ██     ██▄▄▄    █▄▄▄  █   █   █ █ █
--   █ ██▄██ █       █   ▄   █   █   █   █ █   █   █▄█ █
--   █▄█   █▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█   █▄▄▄█▄▄▄█ █▄▄▄█▄▄▄▄▄▄▄█
-- _______________________________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a multiplexor of 4 16-bits channels (a, b, c, d)
-- with 2-bits selector s[2]. 
-- 
-- @components. Mux4 circuits
-- 
-- @function. if s = 0:                 Inputs               Outputs
--                y[n] = a[n];                   _________
--            else if (s = 1):          A[n] ---|         \           
--                y[n] = b[n];          B[n] ---|         |     
--            else if (s = 2):          C[n] ---| MUX4_16 |--- Y[n] 
--                y[n] = c[n];          D[n] ---|         |
--            else:                      s[2] --|_________|
--                y[n] = d[n];
--
-- @truth_table.
--      ______________________________________
--    /| A[n]| B[n]| C[n]| D[n]| s[2] | out[n]|  
--   | | --- | --- | --- | --- | ---- | ----- |        
--   | |  a  |  -  |  -  |  -  |  00  |   a   |       
--   | |  -  |  b  |  -  |  -  |  01  |   b   |    
--   | |  -  |  -  |  c  |  -  |  10  |   c   |       
--   | |  -  |  -  |  -  |  d  |  11  |   d   |                            
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/         
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯            
------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------------------------
entity Mux4_16 is
    Port (
        a, b, c, d: IN std_logic_vector(15 downto 0);
        s1, s2: IN std_logic;
        y: OUT std_logic_vector(15 downto 0)
    );
end Mux4_16;
------------------------------------------------------------------------------------------
architecture structure of Mux4_16 is

    signal mx1, mx2: std_logic_vector(15 downto 0);

    component Mux2_16 is
        Port (
            a, b: IN std_logic_vector(15 downto 0);
            s: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
   
    U1: Mux2_16 PORT map( a => a, b => b, s => s1, y => mx1 );
    U2: Mux2_16 PORT map( a => c, b => d, s => s1, y => mx2 );
    U3: Mux2_16 PORT map( a => mx1, b => mx2, s => s2, y => y);

end structure;
------------------------------------------------------------------------------------------