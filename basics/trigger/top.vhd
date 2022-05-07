library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  port(
    clk_25mhz : in  std_logic;
    led       : out std_logic_vector(7 downto 0);
    btn       : in  std_logic_vector(6 downto 0)
  );
end top;

architecture rtl of top is
  signal cnt : unsigned(7 downto 0);
begin
  process (btn(1))
  begin
    if rising_edge(btn(1)) then
      cnt <= cnt + 1;
    end if;
  end process;

  led <= std_logic_vector(cnt);
end rtl;

