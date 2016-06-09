LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
use  ieee.numeric_std.all;

entity killthebit is

	port
	(
	signal switches : in std_logic_vector(15 downto 0);
	signal leds : out std_logic_vector(15 downto 0);
	signal reset : in std_logic;
	signal clock_slow: in std_logic;
	signal clock_fast: in std_logic;
	signal hard_mode: in std_logic;
	signal win_enable: out std_logic
	);
	
end killthebit;

architecture a of killthebit is

	signal bits : std_logic_vector(15 downto 0) := x"8000";
	signal switches_old : std_logic_vector(15 downto 0) := x"0000";
	signal clock : std_logic;
	signal win_enable_int : std_logic := '0';

begin

	leds <= bits;
	win_enable <= win_enable_int;
	
	process(hard_mode)
		begin
		if(hard_mode = '1') then
			clock <= clock_fast;
		else
			clock <= clock_slow;
		end if;
	end process;

	process(clock, reset)
		begin
		if(rising_edge(clock) and reset = '0') then
			--if(bits = x"0000") then
			--	bits <= x"8000";
			--else
				bits <= std_logic_vector(rotate_right(signed(bits),1));
				win_enable_int <= '0';
			--end if;
			if(((switches_old xor switches) /= x"0000")) then-- and switches /= x"0000") then
				bits <= bits xor switches;
				switches_old <= switches;
			elsif((switches_old xor switches) = x"0000") then
				switches_old <= switches;
			end if;
			if((bits = x"0000")) then-- and ((switches_old xor switches) /= x"0000") and switches = x"0000") then 
			win_enable_int <= '1';
			end if;
		elsif(rising_edge(clock) and reset = '1') then
			bits <= x"8000";
			switches_old <= switches;
			win_enable_int <= '0';
		end if;
		
		
	end process;
end a;
	
		