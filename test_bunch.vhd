library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity tb is 
end entity;

architecture arch of tb is 

component modulo_6 is 

port(clk,rst , UP_DOWN , enable , init: in std_logic;
load : unsigned(3 downto 0);  
Q : out unsigned(3 downto 0)); 

end component; 

signal clk : std_logic := '1' ; signal rst , UP_DOWN , enable , init: std_logic; 

signal load : unsigned(3 downto 0); 

signal Q : unsigned(3 downto 0); 

begin

DUT : modulo_6
port map(clk => clk,
	 rst => rst,
	 enable => enable,
	 UP_DOWN => UP_DOWN,
	 init => init, 
	 load => load, 
	 Q => Q);

clk <= not clk after 10ns ;

load <= "0011";

rst <= '1' , '0' after 10ns; 

enable <= '0' , '1' after 10ns;

init <= '0' , '1' after 10ns , '0' after 20ns;
 
UP_DOWN <= '0' , '1' after 100ns;

end architecture; 