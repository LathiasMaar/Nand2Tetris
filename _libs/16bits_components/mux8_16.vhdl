library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;

entity Mux8_16 is
    Port (
        a, b, c, d, e, f, g, h: IN std_logic_vector(15 downto 0);
        s1, s2, s3: IN std_logic;
        y: OUT std_logic_vector(15 downto 0)
    );
end Mux8_16;

architecture structure of Mux8_16 is

    signal mx1, mx2: std_logic_vector(15 downto 0);

    component Mux4_16 is
        Port (
            a, b, c, d: IN std_logic_vector(15 downto 0);
            s1, s2: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

    component Mux2_16 is
        Port (
            a, b: IN std_logic_vector(15 downto 0);
            s: IN std_logic;
            y: OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
   
    U1: Mux4_16 PORT map( a => a, b => b, c => c, d => d, s1 => s1, s2 => s2, y => mx1 );
    U2: Mux4_16 PORT map( a => e, b => f, c => g, d => h, s1 => s1, s2 => s2, y => mx2 );
    U3: Mux2_16 PORT map( a => mx1, b => mx2, s => s3, y => y);

end structure;

