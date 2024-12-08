----------------------------------------------------------------------------------------------
--    ▄▄▄▄ ▄▄▄     ▄▄▄▄▄▄▄    ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   
--   █    █   █   █  ▄    █  █   ▄  █ █       █       █   █       █       █       █   ▄  █  
--    █   █   █▄▄▄█ █▄█   █  █  █ █ █ █    ▄▄▄█   ▄▄▄▄█   █  ▄▄▄▄▄█▄     ▄█    ▄▄▄█  █ █ █  
--    █   █    ▄  █       █  █   █▄▄█▄█   █▄▄▄█  █  ▄▄█   █ █▄▄▄▄▄  █   █ █   █▄▄▄█   █▄▄█▄ 
--    █   █   █ █ █  ▄   █   █    ▄▄  █    ▄▄▄█  █ █  █   █▄▄▄▄▄  █ █   █ █    ▄▄▄█    ▄▄  █
--    █   █   █▄█ █ █▄█   █  █   █  █ █   █▄▄▄█  █▄▄█ █   █▄▄▄▄▄█ █ █   █ █   █▄▄▄█   █  █ █
--    █▄▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█  █▄▄▄█  █▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄█▄▄▄▄▄▄▄█ █▄▄▄█ █▄▄▄▄▄▄▄█▄▄▄█  █▄█
-- ___________________________________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a 16-bit register memory. This circuits has a 16 bit data (d) 
-- input and a 1-bit load (l) input. When the load input is true, will load the data value
-- into the circuit.
-- 
-- @components. 1-bit memory
-- 
-- @function. if l = 1:
--                  Q(k+1) = D(k)
--            else:
--                  Q(k+1) = Q(k)
--
-- @truth_table.
--      ___________________________
--    /| D[n]|  L  | Qk[n]| Qk+1[n]|             Inputs                    Outputs
--   | | --- | --- | ---- | ------ |                          _________
--   | |  0  |  0  |  0   |   0    |               D -/16b/--|         |--/16b/- Q
--   | |  1  |  0  |  0   |   0    |                         | 16-bit  |
--   | |  0  |  1  |  0   |   0    | (load)             L ---| register| 
--   | |  1  |  1  |  0   |   1    | (load)                  |         |                          
--   | |  0  |  0  |  1   |   1    |                   clk --|\________|
--   | |  1  |  0  |  1   |   1    |
--   | |  0  |  1  |  1   |   0    | (load)
--   | |  1  |  1  |  1   |   1    | (load)
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/  
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯     
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
-----------------------------------------------------------------------------------------
entity b16register is
    Port (
        data: IN std_logic_vector(15 downto 0);
        load: IN std_logic;
        clk: IN std_logic;
        Q: OUT std_logic_vector(15 downto 0)
    );
end b16register;
-----------------------------------------------------------------------------------------
architecture structure of b16register is
    
    component b1memory
        Port (
            data, load, clk: IN std_logic;
            Q: OUT std_logic
        );
    end component;

begin
    U1: b1memory PORT map(
        data => data(0),
        clk => clk,
        load => load,
        Q => Q(0)
    );

    U2: b1memory PORT map(
        data => data(1),
        clk => clk,
        load => load,
        Q => Q(1)
    );

    U3: b1memory PORT map(
        data => data(2),
        clk => clk,
        load => load,
        Q => Q(2)
    );

    U4: b1memory PORT map(
        data => data(3),
        clk => clk,
        load => load,
        Q => Q(3)
    );

    U5: b1memory PORT map(
        data => data(4),
        clk => clk,
        load => load,
        Q => Q(4)
    );

    U6: b1memory PORT map(
        data => data(5),
        clk => clk,
        load => load,
        Q => Q(5)
    );

    U7: b1memory PORT map(
        data => data(6),
        clk => clk,
        load => load,
        Q => Q(6)
    );

    U8: b1memory PORT map(
        data => data(7),
        clk => clk,
        load => load,
        Q => Q(7)
    );

    U9: b1memory PORT map(
        data => data(8),
        clk => clk,
        load => load,
        Q => Q(8)
    );

    U10: b1memory PORT map(
        data => data(9),
        clk => clk,
        load => load,
        Q => Q(9)
    );

    U11: b1memory PORT map(
        data => data(10),
        clk => clk,
        load => load,
        Q => Q(10)
    );

    U12: b1memory PORT map(
        data => data(11),
        clk => clk,
        load => load,
        Q => Q(11)
    );

    U13: b1memory PORT map(
        data => data(12),
        clk => clk,
        load => load,
        Q => Q(12)
    );

    U14: b1memory PORT map(
        data => data(13),
        clk => clk,
        load => load,
        Q => Q(13)
    );

    U15: b1memory PORT map(
        data => data(14),
        clk => clk,
        load => load,
        Q => Q(14)
    );

    U16: b1memory PORT map(
        data => data(15),
        clk => clk,
        load => load,
        Q => Q(15)
    );

end structure;
-----------------------------------------------------------------------------------------
