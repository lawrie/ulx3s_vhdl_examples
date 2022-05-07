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
  signal counter   : unsigned(25 downto 0);

  constant TONE_A4 : integer := 25000000/440/2;
  constant TONE_B4 : integer := 25000000/494/2;
  constant TONE_C5 : integer := 25000000/523/2;
  constant TONE_D5 : integer := 25000000/587/2;
  constant TONE_E5 : integer := 25000000/659/2;
  constant TONE_F5 : integer := 25000000/698/2;
  constant TONE_G5 : integer := 25000000/783/2;
begin
  process (clk_25mhz)
  begin
    if rising_edge(clk_25mhz) then
      if counter = 0 then
        if btn(6) then
          counter <= to_unsigned(TONE_A4, 26);
	elsif btn(5) then
          counter <= to_unsigned(TONE_B4, 26);
	elsif btn(4) then
          counter <= to_unsigned(TONE_C5, 26);
	elsif btn(3) then
          counter <= to_unsigned(TONE_D5, 26);
	elsif btn(2) then
          counter <= to_unsigned(TONE_E5, 26);
	elsif btn(1) then
          counter <= to_unsigned(TONE_F5, 26);
	elsif not btn(0) then
          counter <= to_unsigned(TONE_G5, 26);
        end if;
       else
        counter <= counter - 1;
      end if;
    end if;
  end process;

  process (clk_25mhz)
  begin
    if rising_edge(clk_25mhz) then
      if counter = 0 then
	audio_l <= not audio_l;
	audio_r <= not audio_r;
      end if; 
    end if;
  end process;

end rtl;

