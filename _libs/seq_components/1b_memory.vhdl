-----------------------------------------------------------------------------------------
--    ▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄ ▄▄▄▄▄▄▄    ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   ▄▄   ▄▄ 
--   █    █  ▄    █   █       █  █  █▄█  █       █  █▄█  █       █   ▄  █ █  █ █  █
--    █   █ █▄█   █   █▄     ▄█  █       █    ▄▄▄█       █   ▄   █  █ █ █ █  █▄█  █
--    █   █       █   █ █   █    █       █   █▄▄▄█       █  █ █  █   █▄▄█▄█       █
--    █   █  ▄   ██   █ █   █    █       █    ▄▄▄█       █  █▄█  █    ▄▄  █▄     ▄█
--    █   █ █▄█   █   █ █   █    █ ██▄██ █   █▄▄▄█ ██▄██ █       █   █  █ █ █   █  
--    █▄▄▄█▄▄▄▄▄▄▄█▄▄▄█ █▄▄▄█    █▄█   █▄█▄▄▄▄▄▄▄█▄█   █▄█▄▄▄▄▄▄▄█▄▄▄█  █▄█ █▄▄▄█  
-- ______________________________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a 1-bit memory. This circuits has a data input and a 
-- load (l) input. When the load input is true, will load the data value into the circuit.
-- 
-- @components. DFF circuit, Not gate, And gate, Or gate
-- 
-- @function. if l = 1:
--                  Q(k+1) = D(k)
--            else:
--                  Q(k+1) = Q(k)
--
-- @truth_table.
--      _________________________
--    /|  D  |  L  |  Qk |  Qk+1 |             Inputs               Outputs
--   | | --- | --- | --- | ----- |                       _________
--   | |  0  |  0  |  0  |   0   |                 D ---|         |--- Q
--   | |  1  |  0  |  0  |   0   |                      |  1-bit  |
--   | |  0  |  1  |  0  |   0   | (load)          L ---|  memory | 
--   | |  1  |  1  |  0  |   1   | (load)               |         |                          
--   | |  0  |  0  |  1  |   1   |                clk --|\________|
--   | |  1  |  0  |  1  |   1   |
--   | |  0  |  1  |  1  |   0   | (load)
--   | |  1  |  1  |  1  |   1   | (load)
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/  
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯     
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
-----------------------------------------------------------------------------------------
entity b1memory is
    Port (
        data, load, clk: IN std_logic;
        Q: OUT std_logic
    );
end b1memory;
-----------------------------------------------------------------------------------------
architecture structure of b1memory is
    
    signal not_load, d, s1, s2:std_logic;
    signal Q_in:std_logic;

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

    component DFF is
        Port (
            d, clk: IN std_logic;
            Q, Qn: OUT std_logic
        );
    end component;

begin
    U1: Not_gate PORT map(
        a => load,
        y => not_load  
    );

    U2: And2 PORT map(
        a => data,
        b => load,
        y => s1  
    );

    U3: And2 PORT map(
        a => Q_in,
        b => not_load,
        y => s2  
    );

    U4: Or2 PORT map(
        a => s1,
        b => s2,
        y => d  
    );

    U5: DFF PORT map(
        d => d,
        clk => clk,  
        Q => Q_in
    );

    Q <= Q_in;

end structure;
-----------------------------------------------------------------------------------------
