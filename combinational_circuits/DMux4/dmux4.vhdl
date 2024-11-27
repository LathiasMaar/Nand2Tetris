------------------------------------------------------------------------
--   ▄▄▄▄▄▄  ▄▄   ▄▄ ▄▄   ▄▄ ▄▄   ▄▄ ▄   ▄▄▄ 
--   █      ██  █▄█  █  █ █  █  █▄█  █ █ █   █
--   █  ▄    █       █  █ █  █       █ █▄█   █
--   █ █ █   █       █  █▄█  █       █       █
--   █ █▄█   █       █       ██     ██▄▄▄    █
--   █       █ ██▄██ █       █   ▄   █   █   █
--   █▄▄▄▄▄▄██▄█   █▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█   █▄▄▄█
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a demultiplexor of 4 channels (y1-y4)
-- with 2 selector (s1 and s2). 
-- 
-- @components. Not gates, And3 gates
-- 
-- @function. if (s1=0 and s2=0):          Inputs               Outputs
--                y1 = a; y2 = 0;                   _________
--                y3 = 0; y4 = 0;             A ---|         |--- Y1
--            else if (s1=1 and s2=0):             |  DMUX4  |--- Y2 
--                y1 = 0; y2 = a;             s1 --|         |--- Y3
--                y3 = 0; y4 = 0;             s2 --|_________|--- Y4  
--            else if (s1=0 and s2=1):           
--                y1 = 0; y2 = 0;
--                y3 = a; y4 = 0;
--            else if (s1=1 and s2=1)
--                y1 = 0; y2 = 0;
--                y3 = 0; y4 = a;
-- @truth_table.
--      _________________________________________
--    /|  A  |  s2 |  s1 |  Y1 |  Y2 |  Y3 |  Y4 | 
--   | | --- | --- | --- | --- | --- | --- | --- |  
--   | |  a  |  0  |  0  |  a  |  0  |  0  |  0  | 
--   | |  a  |  0  |  1  |  0  |  a  |  0  |  0  |      
--   | |  a  |  1  |  0  |  0  |  0  |  a  |  0  |     
--   | |  a  |  1  |  1  |  0  |  0  |  0  |  a  |                            
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/          
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯               
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity DMux4 is
    Port (
        a, s1, s2: IN std_logic;
        y1, y2, y3, y4: OUT std_logic
    );
end DMux4;
------------------------------------------------------------------------
architecture structure of DMux4 is
    
    signal not_s1, not_s2:std_logic;

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

begin
    U1: Not_gate PORT map(
        a => s1,
        y => not_s1  --Not s
    );

    U2: Not_gate PORT map(
        a => s2,
        y => not_s2  --Not s
    );

    U3: And3 PORT map(
        a => a,
        b => not_s1,
        c => not_s2,
        y => y1  
    );

    U4: And3 PORT map(
        a => a,
        b => s1,
        c => not_s2,
        y => y2  
    );

    U5: And3 PORT map(
        a => a,
        b => not_s1,
        c => s2,
        y => y3  
    );

    U6: And3 PORT map(
        a => a,
        b => s1,
        c => s2,
        y => y4  
    );
end structure;
------------------------------------------------------------------------
