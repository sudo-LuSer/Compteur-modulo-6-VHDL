library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity modulo_6 is 

port(clk , rst , UP_DOWN , enable , init: in std_logic;
load : in unsigned(3 downto 0); 
Q : out unsigned(3 downto 0));

end entity; 

architecture arch of modulo_6 is 

signal cmp : unsigned(3 downto 0); 

begin  


process (clk , rst)

begin


	if(rst = '1')then 
	
		cmp <= "0000"; 

	elsif(clk ='1' and clk'event)then 
		if(enable = '1')then

		if (UP_DOWN = '1')then 
		
			cmp <= cmp + "0001"; 

		elsif(UP_DOWN = '0')then 

			cmp <= cmp - "0001";

		end if; 

		if(cmp = "0101")then 

			cmp <= "0000";

		end if;

		if(cmp = "1001")then
		
			cmp <= "0000"; 
		
		end if;

		if(init = '1')then 
			
			cmp <= "0000"; 
		
		end if; 
	
		end if;

	end if; 

end process; 

Q <= cmp;

end architecture; 