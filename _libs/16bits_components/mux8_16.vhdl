------------------------------------------------------------------------------------------
--    ▄▄   ▄▄ ▄▄   ▄▄ ▄▄   ▄▄  ▄▄▄▄▄       ▄▄▄▄ ▄▄▄     
--   █  █▄█  █  █ █  █  █▄█  ██  ▄  █     █    █   █    
--   █       █  █ █  █       ██ █▄█ █      █   █   █▄▄▄ 
--   █       █  █▄█  █       █   ▄   █     █   █    ▄  █
--   █       █       ██     ██  █ █  █▄▄▄  █   █   █ █ █
--   █ ██▄██ █       █   ▄   █  █▄█  █   █ █   █   █▄█ █
--   █▄█   █▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█▄▄▄▄▄▄▄█▄▄▄█ █▄▄▄█▄▄▄▄▄▄▄█
-- _______________________________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a multiplexor of 8 16-bits channels (a - h)
-- with 3 selectors s[3]. 
-- 
-- @components. Mux4_16 and Mux2_16 components
-- 
-- @function. if s = 0:               Inputs               Outputs
--                y[n] = a[n];                   _________
--            else if (s = 1):          A[n] ---|         \           
--                y[n] = b[n];          B[n] ---|         |     
--            else if (s = 2):          C[n] ---|         |
--                y[n] = c[n];          D[n] ---|         |
--            else if (s = 3):          E[n] ---| MUX8_16 |--- Y[n]           
--                y[n] = d[n];          F[n] ---|         |     
--            else if (s = 4):          G[n] ---|         |
--                y[n] = e[n];          H[n] ---|         |
--            else  if (s = 5):                 |         |
--                y[n] = f[n];           s[3] --|_________|
--            else  if (s = 6):
--                y[n] = g[n]; 
--            else: 
--                y[n] = h[n];
--
-- @truth_table.
--      ______________________________________________________________
--    /| A[n]| B[n]| C[n]| D[n]| E[n]| F[n]| G[n]| H[n]| s[3] | out[n]|  
--   | | --- | --- | --- | --- | --- | --- | --- | --- | ---- | ----- |        
--   | |  a  |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  000 |   a   |       
--   | |  -  |  b  |  -  |  -  |  -  |  -  |  -  |  -  |  001 |   b   |    
--   | |  -  |  -  |  c  |  -  |  -  |  -  |  -  |  -  |  010 |   c   |       
--   | |  -  |  -  |  -  |  d  |  -  |  -  |  -  |  -  |  011 |   d   | 
--   | |  -  |  -  |  -  |  -  |  e  |  -  |  -  |  -  |  100 |   e   |       
--   | |  -  |  -  |  -  |  -  |  -  |  f  |  -  |  -  |  101 |   f   |    
--   | |  -  |  -  |  -  |  -  |  -  |  -  |  g  |  -  |  110 |   g   |       
--   | |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  h  |  111 |   h   |                            
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/         
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯               
------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------------------------
entity Mux8_16 is
    Port (
        a, b, c, d, e, f, g, h: IN std_logic_vector(15 downto 0);
        s1, s2, s3: IN std_logic;
        y: OUT std_logic_vector(15 downto 0)
    );
end Mux8_16;
------------------------------------------------------------------------------------------
architecture structure of Mux8_16 is

    signal mx1, mx2: std_logic_vector(15 downto 0);

    component Mux4_16 is
        Port (
            a, b, c, d: IN std_logic_vector(15 downto 0);
            s1, s2: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

    component Mux2_16 is
        Port (
            a, b: IN std_logic_vector(15 downto 0);
            s: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
   
    U1: Mux4_16 PORT map( a => a, b => b, c => c, d => d, s1 => s1, s2 => s2, y => mx1 );
    U2: Mux4_16 PORT map( a => e, b => f, c => g, d => h, s1 => s1, s2 => s2, y => mx2 );
    U3: Mux2_16 PORT map( a => mx1, b => mx2, s => s3, y => y);

end structure;
------------------------------------------------------------------------------------------