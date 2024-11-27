------------------------------------------------------------------------
--   ▄▄▄▄▄▄  ▄▄   ▄▄ ▄▄   ▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ 
--   █      ██  █▄█  █  █ █  █  █▄█  █       █
--   █  ▄    █       █  █ █  █       █▄▄▄▄   █
--   █ █ █   █       █  █▄█  █       █▄▄▄▄█  █
--   █ █▄█   █       █       ██     ██ ▄▄▄▄▄▄█
--   █       █ ██▄██ █       █   ▄   █ █▄▄▄▄▄ 
--   █▄▄▄▄▄▄██▄█   █▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█▄▄▄▄▄▄▄█
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a demultiplexor of 2 channels (y1, y2)
-- with 1 selector (s). 
-- 
-- @components. Not gates, And gates, Or gates
-- 
-- @function. if (s) = 0: 
--                y1 = a;
--                y2 = 0;
--            else:
--                y1 = 0;
--                y2 = a;
--
-- @truth_table.
--      _______________________
--    /|  A  |  s  |  Y1 |  Y2 |        Inputs               Outputs
--   | | --- | --- | --- | --- |                  _______
--   | |  a  |  0  |  a  |  0  |                /        |--- Y1
--   | |  a  |  1  |  0  |  a  |          A ---|  DMUX2  |                         
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/              ┌─|_________|--- Y2 
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                s
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity DMux2 is
    Port (
        a, s: IN std_logic;
        y1, y2: OUT std_logic
    );
end DMux2;
------------------------------------------------------------------------
architecture structure of DMux2 is
    signal not_s:std_logic;

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
        b => s,
        y => y2  
    );

    U3: And2 PORT map(
        a => a,
        b => not_s,
        y => y1  
    );
end structure;
------------------------------------------------------------------------
