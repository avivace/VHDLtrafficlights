library ieee;
use ieee.std_logic_1164.all;

entity counter is 
	port ( 
		clk : in  std_logic;
		mod5 : in std_logic;
		mod12 : in std_logic;
		mod15 : in std_logic;
		state_code : in std_logic_vector(1 downto 0);

		rosso : out std_logic;
		giallo : out std_logic;
		verde : out std_logic
	);
end counter;

architecture counterBehavioral of counter is
	signal count : integer range 0 to 100000000;
	signal count_standby : integer range 0 to 100000000;
	signal count_nominal : integer range 0 to 100000000;

	begin
   		process (clk)
			begin
				if (count = 100000000) then
					count <= 0; 
				elsif (rising_edge(clk)) then
					count <= count + 1; -- Conteggia i cicli di clock
				end if;
		end process;

		process (state_code, mod5, mod12, mod15, clk) 
			begin
				case state_code is
					when "11" => -- Disabled
						rosso <= '0';
						giallo <= '0';
						verde <= '0';

						-- Reset Variabili
						count_standby <= 0;
						count_nominal <= 0;
					when "00" => -- Maintenance
						rosso <= '1';
						giallo <= '1';
						verde <= '1';

						-- Reset Variabili
						count_standby <= 0;
						count_nominal <= 0;
					when "10" => -- Standby
						count_nominal <= 0;
						if(rising_edge(clk)) then
							count_standby <= count_standby + 1;
						end if;

						if(count_standby < 100) then
							rosso <= '0';
							giallo <= '1';
							verde <= '0';
						elsif(count_standby < 300) then
							rosso <= '0';
							giallo <= '0';
							verde <= '0';
						else
							count_standby <= 0;
						end if;
					when "01" => -- Nominal 
						count_standby <= 0;
						if(rising_edge(clk)) then
							count_nominal <= count_nominal + 1;
						end if;
						
						if(mod5 = '1') then
							if(count_nominal < 500) then
								rosso <= '1';
								giallo <= '0';
								verde <= '0';
							elsif(count_nominal < 800) then
								rosso <= '0';
								giallo <= '0';
								verde <= '1';
							elsif(count_nominal < 1000) then
								rosso <= '0';
								giallo <= '1';
								verde <= '1';
							else
								count_nominal <= 0;
							end if;
						elsif(mod12 = '1') then
							if(count_nominal < 1200) then
								rosso <= '1';
								giallo <= '0';
								verde <= '0';
							elsif(count_nominal < 2200) then
								rosso <= '0';
								giallo <= '0';
								verde <= '1';
							elsif(count_nominal < 2400) then
								rosso <= '0';
								giallo <= '1';
								verde <= '1';
							else
								count_nominal <= 0;
							end if;
						elsif(mod15 = '1') then
							if(count_nominal < 1500) then
								rosso <= '1';
								giallo <= '0';
								verde <= '0';
							elsif(count_nominal < 2800) then
								rosso <= '0';
								giallo <= '0';
								verde <= '1';
							elsif(count_nominal < 3000) then
								rosso <= '0';
								giallo <= '1';
								verde <= '1';
							else
								count_nominal <= 0;
							end if;
						end if;

					when others =>
						rosso <= '0';
						giallo <= '0';
						verde <= '0';

				end case;
		end process;
end counterBehavioral;
