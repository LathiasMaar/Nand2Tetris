library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;

entity DMux1to2 is
    Port (
        a, s: IN std_logic;
        y1, y2: OUT std_logic
    );
end DMux1to2;

architecture structure of DMux1to2 is
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

