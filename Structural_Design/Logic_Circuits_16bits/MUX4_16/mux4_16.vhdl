library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;

entity Mux4_16 is
    Port (
        a, b, c, d: IN std_logic_vector(15 downto 0);
        s: IN std_logic_vector(1 downto 0);
        y: OUT std_logic_vector(15 downto 0)
    );
end Mux4_16;

architecture structure of Mux4_16 is

    signal mx1, mx2: std_logic_vector(15 downto 0);

    component Mux2_16 is
        Port (
            a, b: IN std_logic_vector(15 downto 0);
            s: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
   
    U1: Mux2_16 PORT map( a => a, b => b, s => s(0), y => mx1 );
    U2: Mux2_16 PORT map( a => c, b => d, s => s(0), y => mx2 );
    U3: Mux2_16 PORT map( a => mx1, b => mx2, s => s(1), y => y);

end structure;

