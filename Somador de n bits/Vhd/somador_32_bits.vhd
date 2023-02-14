---------------------------------------------------------------------------------------------------
-- 
-- Autor(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Codificador(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Data: 17/10/2022
--
-- Organizaçao: Grupo de Pesquisa em Hardware - GPH
-- Instituiçao: Universidade Federal do Rio Grande do Norte - UFRN
-- 
-- Componente(s) eletronico(s): somador de 32 bits
--
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY somador_32_bits IS
PORT(
		A_s32b, B_s32b: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Cin_s32b: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		S_s32b: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		Cout_s32b: OUT STD_LOGIC
);
END somador_32_bits;


ARCHITECTURE soma OF somador_32_bits IS
	COMPONENT somador_16_bits
		PORT(
			A_s16b, B_s16b: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			Cin_s16b: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			S_s16b: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			Cout_s16b: OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL Z: STD_LOGIC; -- Sinal do carry da parte LSB do bit
	
BEGIN 

z0: somador_16_bits PORT MAP(A_s32b(15 DOWNTO 0), B_s32b(15 DOWNTO 0), Cin_s32b, clk, S_s32b(15 DOWNTO 0), Z);
z1: somador_16_bits PORT MAP(A_s32b(31 DOWNTO 16), B_s32b(31 DOWNTO 16), Z, clk, S_s32b(31 DOWNTO 16), Cout_s32b);

END soma;