------------------------------------------------------------------------
--    ▄▄   ▄▄ ▄▄   ▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄    
--   █  █▄█  █  █ █  █  █▄█  █       █   
--   █       █  █ █  █       █▄▄▄▄   █   
--   █       █  █▄█  █       █▄▄▄▄█  █   
--   █       █       ██     ██ ▄▄▄▄▄▄█   
--   █ ██▄██ █       █   ▄   █ █▄▄▄▄▄    
--   █▄█   █▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█▄▄▄▄▄▄▄█   
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a multiplexor of 2 inputs (a, b)
-- with 1 selector (s). 
-- 
-- @components. Not gates, And gates, Or gates
-- 
-- @function. if (s) = 0: 
--                y = a;
--            else:
--                y = b;
--
-- @truth_table.
--      _______________________
--    /|  A  |  B  |  s  | out |        Inputs               Outputs
--   | | --- | --- | --- | --- |                _________
--   | |  a  |  -  |  0  |  a  |          A ---|         \
--   | |  -  |  b  |  1  |  b  |          B ---|  MUX2   |--- Y                        
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/            s --|_________| 
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Mux2 is
    Port (
        a, b, s: IN std_logic;
        y: OUT std_logic
    );
end Mux2;
------------------------------------------------------------------------
architecture structure of Mux2 is
    signal not_s, sel_a, sel_b:std_logic;

    component Not_gate
        port(
            a : in std_logic;
            y : out std_logic
        );
    end component;

    component And2
        port(
            a : in std_logic;
            b : in std_logic;
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
        a => s,
        y => not_s  --Not s
    );

    U2: And2 PORT map(
        a => a,
        b => not_s,
        y => sel_a  
    );

    U3: And2 PORT map(
        a => b,
        b => s,
        y => sel_b  
    );

    U4: Or2 PORT map(
        a => sel_a,
        b => sel_b,
        y => y  
    );
end structure;
------------------------------------------------------------------------