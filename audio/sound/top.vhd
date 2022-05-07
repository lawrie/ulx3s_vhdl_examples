library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  port(
    clk_25mhz : in  std_logic;
    btn       : in  std_logic_vector(6 downto 0);
    audio_l   : out std_logic_vector(3 downto 0);
    audio_r   : out std_logic_vector(3 downto 0)
  );
end top;

architecture rtl of top is
  signal tone      : unsigned(23 downto 0);
  signal counter   : unsigned(25 downto 0);

  constant TONE_A4 : integer := (25000000 / 440 / 2);
  constant TONE_A5 : integer := (25000000 / 880 / 2);
begin
  process (clk_25mhz)
  begin
    if rising_edge(clk_25mhz) then
      tone <= tone + 1;
    end if;
  end process;

  process (clk_25mhz)
  begin
    if rising_edge(clk_25mhz) then
      if counter = 0 then
        if tone(23) = '1' then
          counter <= to_unsigned(TONE_A4, 26);
	else
          counter <= to_unsigned(TONE_A5, 26); 
        end if;
	audio_l <= not audio_l;
	audio_r <= not audio_r;
      else
        counter <= counter - 1;
      end if; 
    end if;
  end process;

end rtl;

