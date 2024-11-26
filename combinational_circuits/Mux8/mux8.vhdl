library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;

entity Mux8 is
    Port (
        a, b, c, d, e, f, g, h: IN std_logic;
        s: std_logic_vector(2 downto 0);
        y: OUT std_logic
    );
end Mux8;

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

