LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY acc_clk_gen IS

	PORT
	(
		clock_50Mhz			  : IN	STD_LOGIC;
		clock_slow				: OUT	STD_LOGIC;
		clock_fast : out std_logic
	);
	
END acc_clk_gen;

ARCHITECTURE a OF acc_clk_gen IS

	SIGNAL	count_10hz      : STD_LOGIC_VECTOR(22 DOWNTO 0); 
	SIGNAL	clock_10hz_int  : STD_LOGIC; 
	SIGNAL	count_fast      : STD_LOGIC_VECTOR(22 DOWNTO 0); 
	SIGNAL	clock_fast_int  : STD_LOGIC; 
	
BEGIN
	PROCESS 
	BEGIN

		WAIT UNTIL clock_50Mhz'EVENT and clock_50Mhz = '1';
		clock_slow <= clock_10hz_int;
			IF count_10hz < 2500000 THEN
				count_10hz <= count_10hz + 1;
			ELSE
				count_10hz <= "00000000000000000000000";
				clock_10hz_int <= NOT(clock_10hz_int);
			END IF;

	END PROCESS;	
	
	PROCESS 
	BEGIN

		WAIT UNTIL clock_50Mhz'EVENT and clock_50Mhz = '1';
		clock_fast <= clock_fast_int;
			IF count_fast < 1250000 THEN
				count_fast <= count_fast + 1;
			ELSE
				count_fast <= "00000000000000000000000";
				clock_fast_int <= NOT(clock_fast_int);
			END IF;

	END PROCESS;

END a;

