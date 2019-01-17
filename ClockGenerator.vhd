library ieee;
use ieee.std_logic_1164.all;

entity clkGenerator is
	port(clock_out: out std_logic);
end clkGenerator;
    
architecture clkGeneratorBehavior of clkGenerator is

	begin
		process
			begin
				clock_out <= '1'; wait for 5 ms;
				clock_out <= '0'; wait for 5 ms;
		end process;

end clkGeneratorBehavior;