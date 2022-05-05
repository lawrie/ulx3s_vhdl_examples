library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  port(
    clk_25mhz : in  std_logic;
    led       : out std_logic_vector(7 downto 0)
  );
end top;

architecture rtl of top is
  signal cnt : unsigned(31 downto 0);
begin
  process (clk_25mhz)
  begin
    if rising_edge(clk_25mhz) then
      cnt <= cnt + 1;
    end if;
  end process;

  led <= std_logic_vector(cnt(31 downto 24));
end rtl;

