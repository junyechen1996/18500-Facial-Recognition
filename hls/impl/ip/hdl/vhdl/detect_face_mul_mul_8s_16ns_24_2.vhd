
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detect_face_mul_mul_8s_16ns_24_2_DSP48_0 is
port (
    clk: in std_logic;
    rst: in std_logic;
    ce: in std_logic;
    a: in std_logic_vector(8 - 1 downto 0);
    b: in std_logic_vector(16 - 1 downto 0);
    p: out std_logic_vector(24 - 1 downto 0));

end entity;

architecture behav of detect_face_mul_mul_8s_16ns_24_2_DSP48_0 is
    signal a_cvt: signed(8 - 1 downto 0);
    signal b_cvt: unsigned(16 - 1 downto 0);
    signal p_cvt: signed(24 - 1 downto 0);

    signal p_reg: signed(24 - 1 downto 0);
begin

    a_cvt <= signed(a);
    b_cvt <= unsigned(b);

    process(clk)
    begin
        if (clk'event and clk = '1') then
            if rst = '1' then
                p_reg <= (others => '0');
            else
                if (ce = '1') then
                    p_reg <= p_cvt;
                end if;
            end if;
        end if;
    end process;

    p_cvt <= signed (resize(unsigned (signed (a_cvt) * signed ('0' & b_cvt)), 24));
    p <= std_logic_vector(p_reg);

end architecture;

Library IEEE;
use IEEE.std_logic_1164.all;

entity detect_face_mul_mul_8s_16ns_24_2 is
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER);
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR(din0_WIDTH - 1 DOWNTO 0);
        din1 : IN STD_LOGIC_VECTOR(din1_WIDTH - 1 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0));
end entity;

architecture arch of detect_face_mul_mul_8s_16ns_24_2 is
    component detect_face_mul_mul_8s_16ns_24_2_DSP48_0 is
        port (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            ce : IN STD_LOGIC;
            a : IN STD_LOGIC_VECTOR;
            b : IN STD_LOGIC_VECTOR;
            p : OUT STD_LOGIC_VECTOR);
    end component;



begin
    detect_face_mul_mul_8s_16ns_24_2_DSP48_0_U :  component detect_face_mul_mul_8s_16ns_24_2_DSP48_0
    port map (
        clk => clk,
        rst => reset,
        ce => ce,
        a => din0,
        b => din1,
        p => dout);

end architecture;


