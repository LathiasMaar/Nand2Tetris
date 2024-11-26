library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;

entity Mux2_16 is
    Port (
        a, b: IN std_logic_vector(15 downto 0);
        s: IN std_logic;
        y: OUT std_logic_vector(15 downto 0)
    );
end Mux2_16;

architecture structure of Mux2_16 is

    component Mux2 is
        Port (
            a, b, s: IN std_logic;
            y: OUT std_logic
        );
    end component;

begin
   
    U1: Mux2 PORT map( a => a(0), b => b(0), s => s, y => y(0) );
    U2: Mux2 PORT map( a => a(1), b => b(1), s => s, y => y(1) );
    U3: Mux2 PORT map( a => a(2), b => b(2), s => s, y => y(2) );
    U4: Mux2 PORT map( a => a(3), b => b(3), s => s, y => y(3) );
    U5: Mux2 PORT map( a => a(4), b => b(4), s => s, y => y(4) );
    U6: Mux2 PORT map( a => a(5), b => b(5), s => s, y => y(5) );
    U7: Mux2 PORT map( a => a(6), b => b(6), s => s, y => y(6) );
    U8: Mux2 PORT map( a => a(7), b => b(7), s => s, y => y(7) );
    U9: Mux2 PORT map( a => a(8), b => b(8), s => s, y => y(8) );
    U10: Mux2 PORT map( a => a(9), b => b(9), s => s, y => y(9) );
    U11: Mux2 PORT map( a => a(10), b => b(10), s => s, y => y(10) );
    U12: Mux2 PORT map( a => a(11), b => b(11), s => s, y => y(11) );
    U13: Mux2 PORT map( a => a(12), b => b(12), s => s, y => y(12) );
    U14: Mux2 PORT map( a => a(13), b => b(13), s => s, y => y(13) );
    U15: Mux2 PORT map( a => a(14), b => b(14), s => s, y => y(14) );
    U16: Mux2 PORT map( a => a(15), b => b(15), s => s, y => y(15) );

end structure;

