LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Forwarding remains to be implemented.

ENTITY EXMEM_buffer IS
PORT ( Branch_Taken_in : IN STD_LOGIC;
       Branch_Taken_out : OUT STD_LOGIC;
       ALU_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       ALU_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
       THREE_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       THREE_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
       FIVE_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       FIVE_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END EXMEM_buffer;

ARCHITECTURE EXMEM_buffer_arch OF EXMEM_buffer IS
BEGIN

buffer : PROCESS(clock)
BEGIN
  Branch_Taken_out <= Branch_Taken_in;
  THREE_out <= THREE_in;
  ALU_out <= ALU_in;
  FIVE_out <= FIVE_in;
END PROCESS buffer;
END EXMEM_buffer_arch;
