library ieee;
use IEEE.std_logic_1164.all;
use std.STANDARD.BOOLEAN;

entity fsm is
	port (
		clk : in std_logic;
		enable : in std_logic;
		reset : in std_logic;
		state : in std_logic_vector(1 downto 0);
		mode : in std_logic;
		
		mod5 : out std_logic;
		mod12 : out std_logic;
		mod15 : out std_logic;
		state_code : out std_logic_vector(1 downto 0)
	);
end fsm;

architecture behavioral of fsm is

	type state_type is (m5,m12,m15,n5,n12,n15,s5,s12,s15); -- Stati
	signal current_s,next_s: state_type; -- Stato corrente e prossimo stato

	begin

	process (clk,reset)
		begin
			if (reset='0') then
				current_s <= m5; -- Stato di default quando il reset passa a 0
			elsif (rising_edge(clk)) then
				current_s <= next_s; -- Cambiamento di stato
			end if;
	end process;

	process (current_s, state, enable)
		begin
			case current_s is
				when m5 =>
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= m5;
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "01") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "01";
						next_s <= n5;
					elsif(state = "10") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "10";
						next_s <= s5;
					elsif(state = "11" and mode = '0') then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m12;
					elsif(state = "11" and mode = '1') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "00";
						next_s <= m15;
					end if;   

				when m12 =>
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= m12;	 
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00" or (state = "11" and mode = '0')) then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m12;
					elsif(state = "01") then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "01";
						next_s <= n12;
					elsif(state = "10") then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "10";
						next_s <= s12;
					elsif(state = "11" and mode = '1') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "00";
						next_s <= m15;
					end if;

				when m15 =>	
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= m15; 
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00" or (state = "11" and mode = '1')) then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "00";
						next_s <= m15;
					elsif(state = "01") then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "01";
						next_s <= n15;
					elsif(state = "10") then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "10";
						next_s <= s15;
					elsif(state = "11" and mode = '0') then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m12;
					end if;

				when n5 =>	
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= n5; 
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "01") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "01";
						next_s <= n5;
					elsif(state = "10") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "10";
						next_s <= s5;
					end if;

				when n12 =>	
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= n12; 
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00") then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m12;
					elsif(state = "01") then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "01";
						next_s <= n12;
					elsif(state = "10") then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "10";
						next_s <= s12;
					end if;

				when n15 =>	
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= n15; 
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00") then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "00";
						next_s <= m15;
					elsif(state = "01") then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "01";
						next_s <= n15;
					elsif(state = "10") then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "10";
						next_s <= s15;
					end if;

				when s5 =>	
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= s5; 
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "01") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "01";
						next_s <= n5;
					elsif(state = "10") then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "10";
						next_s <= s5;
					end if;

				when s12 =>	
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= s12; 
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00") then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m12;
					elsif(state = "01") then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "01";
						next_s <= n12;
					elsif(state = "10") then
						mod5 <= '0';
						mod12 <= '1';
						mod15 <= '0';
						state_code <= "10";
						next_s <= s12;
					end if;

				when s15 =>	
					if(enable = '0') then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "11";
						next_s <= s15; 
					elsif(reset = '0') then
						mod5 <= '1';
						mod12 <= '0';
						mod15 <= '0';
						state_code <= "00";
						next_s <= m5;
					elsif(state = "00") then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "00";
						next_s <= m15;
					elsif(state = "01") then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "01";
						next_s <= n15;
					elsif(state = "10") then
						mod5 <= '0';
						mod12 <= '0';
						mod15 <= '1';
						state_code <= "10";
						next_s <= s15;
					end if;
			end case;
	end process;
end behavioral;