library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
	 	 
entity signalControlGenerator is
	port ( 
		state : out std_logic_vector(1 downto 0);
		mode : out std_logic;
		enable : out std_logic;
		reset : out std_logic
	);
end signalControlGenerator;
    
architecture signalControlGeneratorBehavior of signalControlGenerator is
	begin
		process
			begin
				enable <= '1';
				reset <= '1';
				state <= "00"; mode <= '0'; wait for 10 sec;
				state <= "00"; mode <= '1'; wait for 10 sec;
				state <= "01"; mode <= '0'; wait for 20 sec;
				state <= "01"; mode <= '1'; wait for 20 sec;
				state <= "10"; mode <= '0'; wait for 10 sec;
				state <= "10"; mode <= '1'; wait for 10 sec;
				state <= "11"; mode <= '0'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance
				state <= "11"; mode <= '1'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance

				-- enable <= '0';
				state <= "00"; mode <= '0'; wait for 10 sec;
				state <= "11"; mode <= '0'; wait for 10 sec; -- Rimodulazine possibile perchè sono in maintenance
				state <= "00"; mode <= '1'; wait for 10 sec;
				state <= "01"; mode <= '0'; wait for 20 sec;
				state <= "01"; mode <= '1'; wait for 20 sec;
				state <= "10"; mode <= '0'; wait for 10 sec;
				state <= "10"; mode <= '1'; wait for 10 sec;
				state <= "11"; mode <= '0'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance
				state <= "11"; mode <= '1'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance
				
				-- enable <= '1';
				state <= "00"; mode <= '0'; wait for 10 sec;
				state <= "11"; mode <= '1'; wait for 10 sec; -- Rimodulazine possibile perchè sono in maintenance
				state <= "00"; mode <= '1'; wait for 10 sec;
				state <= "01"; mode <= '0'; wait for 20 sec;
				state <= "01"; mode <= '1'; wait for 20 sec;
				state <= "10"; mode <= '0'; wait for 10 sec;
				state <= "10"; mode <= '1'; wait for 10 sec;
				state <= "11"; mode <= '0'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance
				state <= "11"; mode <= '1'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance
				
				reset <= '0'; wait for 5 sec;
				
				state <= "00"; mode <= '0'; wait for 10 sec;
				state <= "00"; mode <= '1'; wait for 10 sec;
				state <= "01"; mode <= '0'; wait for 20 sec;
				state <= "01"; mode <= '1'; wait for 20 sec;
				state <= "10"; mode <= '0'; wait for 10 sec;
				state <= "10"; mode <= '1'; wait for 10 sec;
				state <= "11"; mode <= '0'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance
				state <= "11"; mode <= '1'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance

				enable <= '0';
				state <= "00"; mode <= '0'; wait for 10 sec;
				state <= "11"; mode <= '0'; wait for 10 sec; -- Rimodulazine possibile perchè sono in maintenance
				state <= "00"; mode <= '1'; wait for 10 sec;
				state <= "01"; mode <= '0'; wait for 20 sec;
				state <= "01"; mode <= '1'; wait for 20 sec;
				state <= "10"; mode <= '0'; wait for 10 sec;
				state <= "10"; mode <= '1'; wait for 10 sec;
				state <= "11"; mode <= '0'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance
				state <= "11"; mode <= '1'; wait for 10 sec; -- Stato ignorato perchè cerco di rimodulare quando non sono in maintenance
				

    		end process;
	   
end signalControlGeneratorBehavior;

