LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;


entity hex_driver is
	port(
	signal enable : in std_logic;
	signal hex00_out : out std_logic_vector(6 downto 0);
	signal hex01_out : out std_logic_vector(6 downto 0);
	signal hex02_out : out std_logic_vector(6 downto 0);
	signal hex03_out : out std_logic_vector(6 downto 0);
	signal hex04_out : out std_logic_vector(6 downto 0);
	signal hex05_out : out std_logic_vector(6 downto 0);
	signal hex06_out : out std_logic_vector(6 downto 0);
	signal hex07_out : out std_logic_vector(6 downto 0)
	);
end hex_driver;

architecture a of hex_driver is
begin
	process(enable)
	begin
		if(enable = '1') then
			hex00_out <= "0101011";
			hex01_out <= "1111011";
			hex02_out <= "1100001";
			hex03_out <= "1000011";
			hex04_out <= "1111111";
			hex05_out <= "1100011";
			hex06_out <= "0100011";
			hex07_out <= "0010001";
		else
			hex00_out <= "1111111";
			hex01_out <= "1111111";
			hex02_out <= "1111111";
			hex03_out <= "1111111";
			hex04_out <= "1111111";
			hex05_out <= "1111111";
			hex06_out <= "1111111";
			hex07_out <= "1111111";
		end if;
	end process;
end a;