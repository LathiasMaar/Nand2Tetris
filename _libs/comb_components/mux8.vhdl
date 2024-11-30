------------------------------------------------------------------------
--    ▄▄   ▄▄ ▄▄   ▄▄ ▄▄   ▄▄  ▄▄▄▄▄     
--   █  █▄█  █  █ █  █  █▄█  ██  ▄  █    
--   █       █  █ █  █       ██ █▄█ █    
--   █       █  █▄█  █       █   ▄   █   
--   █       █       ██     ██  █ █  █   
--   █ ██▄██ █       █   ▄   █  █▄█  █   
--   █▄█   █▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█▄▄▄▄▄▄▄█   
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a multiplexor of 8 inputs (a - h)
-- with 3 selectors s[3]. 
-- 
-- @components. Mux4 and Mux2 components
-- 
-- @function. if s = 0:                 Inputs               Outputs
--                y = a;                         _________
--            else if (s = 1):             A ---|         \           
--                y = b;                   B ---|         |     
--            else if (s = 2):             C ---|         |
--                y = c;                   D ---|         |
--            else if (s = 3):             E ---|  MUX8   |--- Y           
--                y = d;                   F ---|         |     
--            else if (s = 4):             G ---|         |
--                y = e;                   H ---|         |
--            else  if (s = 5):                 |         |
--                y = f;                 s[3] --|_________|
--            else  if (s = 6):
--                y = g; 
--            else: 
--                y = h;
--
-- @truth_table.
--      ____________________________________________________________
--    /|  A  |  B  |  C  |  D  |  E  |  F  |  G  |  H  | s[3] | out |  
--   | | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- |        
--   | |  a  |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  000 |  a  |       
--   | |  -  |  b  |  -  |  -  |  -  |  -  |  -  |  -  |  001 |  b  |    
--   | |  -  |  -  |  c  |  -  |  -  |  -  |  -  |  -  |  010 |  c  |       
--   | |  -  |  -  |  -  |  d  |  -  |  -  |  -  |  -  |  011 |  d  | 
--   | |  -  |  -  |  -  |  -  |  e  |  -  |  -  |  -  |  100 |  e  |       
--   | |  -  |  -  |  -  |  -  |  -  |  f  |  -  |  -  |  101 |  f  |    
--   | |  -  |  -  |  -  |  -  |  -  |  -  |  g  |  -  |  110 |  g  |       
--   | |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  h  |  111 |  h  |                            
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/         
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Mux8 is
    Port (
        a, b, c, d, e, f, g, h: IN std_logic;
        s: std_logic_vector(2 downto 0);
        y: OUT std_logic
    );
end Mux8;
------------------------------------------------------------------------
architecture structure of Mux8 is
    signal mx1, mx2 :std_logic;

    component Mux4
        Port (
            a, b, c, d, s1, s2: IN std_logic;
            y: OUT std_logic
        );
    end component;

    component Mux2
        Port (
            a, b, s: IN std_logic;
            y: OUT std_logic
        );
    end component;

begin

    U1: Mux4 PORT map(
        a => a, b => b, c => c, d => d,
        s1 => s(0), s2 => s(1),
        y => mx1  
    );

    U2: Mux4 PORT map(
        a => e, b => f, c => g, d => h,
        s1 => s(0), s2 => s(1),
        y => mx2  
    );

    U3: Mux2 PORT map(
        a => mx1, b => mx2, s => s(2), 
        y => y  
    );

end structure;
------------------------------------------------------------------------