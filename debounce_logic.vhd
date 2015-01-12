library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debounce_logic is
    Port (
        clkIn : in STD_LOGIC;
		buttonIn : in STD_LOGIC; 
        buttonOut: out STD_LOGIC
    );
end debounce_logic;

architecture Behavioral of debounce_logic is

signal temp : STD_LOGIC_VECTOR(6 downto 0);
signal notButton : STD_LOGIC;

begin
fdiv: process (clkIn) begin
	if rising_edge(clkIn) then
		temp(0) <= notButton;
		temp(1) <= temp(0);
		temp(2) <= temp(1);
		temp(3) <= temp(2);
		temp(4) <= temp(3);
		temp(5) <= temp(4);
		temp(6) <= temp(5);
	end if;
end process;

buttonOut <= ((((((temp(0) and temp(1)) and temp(2)) and temp(3)) and temp(4)) and temp(5)) and temp(6));
notButton <= not buttonIn;

end Behavioral;
