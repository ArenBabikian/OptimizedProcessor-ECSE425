LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY EX IS
-- ONE,TWO,THREE,THREE_OUT,FOUR,FIVE,SEL1,SEL2 are placeholder names
  PORT( ONE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        TWO : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        THREE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        FOUR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        FIVE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        SEL1 : IN STD_LOGIC;
        SEL2 : IN STD_LOGIC;
        ALUCtr1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        ALU_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Branch_Taken :  OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        THREE_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        FIVE_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END EX;

ARCHITECTURE EX_arch OF EX IS

COMPONENT mux IS
  PORT( SEL : IN STD_LOGIC;
        A   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        B   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        x   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;

COMPONENT ALU IS
  PORT(
    Data1: in STD_LOGIC_VECTOR (31 downto 0);
    Data2: in STD_LOGIC_VECTOR (31 downto 0);
    ALUCtr : in  STD_LOGIC_VECTOR (3 downto 0);
    Zero : out STD_LOGIC;
    ALU_Result : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

SIGNAL X1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL X2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ZEROALU : STD_LOGIC;

BEGIN
mux1: mux port map(SEL1,ONE,TWO,X1);
mux2: mux port map(SEL2,THREE,FOUR,X2);
ALU1: ALU port map(X1,X2,ALUCtr1,ZEROALU,ALU_OUT);

Branch_Taken <= TWO WHEN (ZEROALU = '1');
THREE_OUT <= THREE;
FIVE_OUT <= FIVE;


END EX_arch;