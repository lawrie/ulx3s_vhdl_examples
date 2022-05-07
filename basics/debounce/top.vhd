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
  signal cnt      : unsigned(7 downto 0);
  signal clk_cnt  : unsigned(23 downto 0);
  signal prev_btn : std_logic;
begin
  process (clk_25mhz)
  begin
    if rising_edge(clk_25mhz) then
      clk_cnt <= clk_cnt + 1;
    end if;
  end process;

  process (clk_cnt(20))
  begin
    if rising_edge(clk_cnt(20)) then
      prev_btn <= btn(1);
      if prev_btn = '0' and btn(1) = '1' then
          cnt <= cnt + 1;
      end if;
    end if;
  end process;

  led <= std_logic_vector(cnt);
end rtl;

