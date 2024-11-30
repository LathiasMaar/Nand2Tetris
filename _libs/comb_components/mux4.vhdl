------------------------------------------------------------------------
--    ▄▄   ▄▄ ▄▄   ▄▄ ▄▄   ▄▄ ▄   ▄▄▄    
--   █  █▄█  █  █ █  █  █▄█  █ █ █   █   
--   █       █  █ █  █       █ █▄█   █   
--   █       █  █▄█  █       █       █   
--   █       █       ██     ██▄▄▄    █   
--   █ ██▄██ █       █   ▄   █   █   █   
--   █▄█   █▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█   █▄▄▄█   
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a multiplexor of 4 inputs (a, b, c, d)
-- with 2 selectors s[2]. 
-- 
-- @components. Not gates, And3 gates, Or2 gates
-- 
-- @function. if s = 0:                 Inputs               Outputs
--                y = a;                         _________
--            else if (s = 1):             A ---|         \           
--                y = b;                   B ---|         |     
--            else if (s = 2):             C ---|  MUX4   |--- Y 
--                y = c;                   D ---|         |
--            else:                      s[2] --|_________|
--                y = d;
--
-- @truth_table.
--      ___________________________________
--    /|  A  |  B  |  C  |  D  | s[2] | out |  
--   | | --- | --- | --- | --- | ---- | --- |        
--   | |  a  |  -  |  -  |  -  |  00  |  a  |       
--   | |  -  |  b  |  -  |  -  |  01  |  b  |    
--   | |  -  |  -  |  c  |  -  |  10  |  c  |       
--   | |  -  |  -  |  -  |  d  |  11  |  d  |                            
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/         
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Mux4 is
    Port (
        a, b, c, d, s1, s2: IN std_logic;
        y: OUT std_logic
    );
end Mux4;
------------------------------------------------------------------------
architecture structure of Mux4 is
    signal not_s1, not_s2, sel_a, sel_b, sel_c, sel_d, sel1, sel2:std_logic;

    component Not_gate
        port(
            a : in std_logic;
            y : out std_logic
        );
    end component;

    component And3
        port(
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            y : out std_logic
        );
    end component;

    component Or2
        port(
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;

begin
    U1: Not_gate PORT map(
        a => s1,
        y => not_s1  --Not s1
    );

    U2: Not_gate PORT map(
        a => s2,
        y => not_s2  --Not s2
    );

    U3: And3 PORT map(
        a => a,
        b => not_s1,
        c => not_s2,
        y => sel_a  
    );

    U4: And3 PORT map(
        a => b,
        b => s1,
        c => not_s2,
        y => sel_b  
    );

    U5: And3 PORT map(
        a => c,
        b => not_s1,
        c => s2,
        y => sel_c  
    );

    U6: And3 PORT map(
        a => d,
        b => s1,
        c => s2,
        y => sel_d  
    );

    U7: Or2 PORT map(
        a => sel_a,
        b => sel_b,
        y => sel1  
    );

    U8: Or2 PORT map(
        a => sel_c,
        b => sel_d,
        y => sel2  
    );

    U9: Or2 PORT map(
        a => sel1,
        b => sel2,
        y => y  
    );
end structure;
------------------------------------------------------------------------