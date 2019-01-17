library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
	 	 
entity testBench is
end testBench;
    
architecture testBenchBehavior of testBench is
    
	component clkGenerator is
    		port(clock_out: out std_logic);
	end component;

	component signalControlGenerator is
		port ( 
			state : out std_logic_vector(1 downto 0);
			mode : out std_logic;
			enable : out std_logic;
			reset : out std_logic
		);
	end component;

	component fsm is
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
	end component;

	component counter is 
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
	end component;

	signal clock_in : std_logic;
	signal enable_in : std_logic;
	signal reset_in : std_logic;
	signal state_in : std_logic_vector(1 downto 0);
	signal mode_in : std_logic;

	signal mod5_out : std_logic;
	signal mod12_out : std_logic;
	signal mod15_out : std_logic;
	signal state_code_out : std_logic_vector(1 downto 0);
	
	signal rosso_out : std_logic;
	signal giallo_out : std_logic;
	signal verde_out : std_logic;

	begin

	clk_gen: clkGenerator port map(clock_in);
	signal_gen: signalControlGenerator port map(state_in, mode_in, enable_in, reset_in);
	finite_state_machine: fsm port map(clock_in, enable_in, reset_in, state_in, mode_in, mod5_out, mod12_out, mod15_out, state_code_out);
	semaphore: counter port map(clock_in, mod5_out, mod12_out, mod15_out, state_code_out, rosso_out, giallo_out, verde_out);

end testBenchBehavior;