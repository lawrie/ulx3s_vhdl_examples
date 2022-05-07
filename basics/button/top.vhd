library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity top is
  port(
    led : out std_logic_vector(7 downto 0);
    btn : in  std_logic_vector(6 downto 0)
  );
end top;

architecture rtl of top is
begin
    led <= "0" & btn;
end rtl;

