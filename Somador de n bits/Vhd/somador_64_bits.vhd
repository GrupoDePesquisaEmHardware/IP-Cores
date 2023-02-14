---------------------------------------------------------------------------------------------------
-- 
-- Autor(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Codificador(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Data: 17/10/2022
--
-- Organizaçao: Grupo de Pesquisa em Hardware - GPH
-- Instituiçao: Universidade Federal do Rio Grande do Norte - UFRN
-- 
-- Componente(s) eletronico(s): somador de 64 bits
--
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY somador_64_bits IS
PORT(
		A_s64b, B_s64b: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
		Cin_s64b: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		S_s64b: OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
		Cout_s64b: OUT STD_LOGIC
);
END somador_64_bits;


ARCHITECTURE soma OF somador_64_bits IS
	COMPONENT somador_32_bits
		PORT(
			A_s32b, B_s32b: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			Cin_s32b: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			S_s32b: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			Cout_s32b: OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL Z: STD_LOGIC; -- Sinal do carry da parte LSB do bit
	
BEGIN 

z0: somador_32_bits PORT MAP(A_s64b(31 DOWNTO 0), B_s64b(31 DOWNTO 0), Cin_s64b, clk, S_s64b(31 DOWNTO 0), Z);
z1: somador_32_bits PORT MAP(A_s64b(63 DOWNTO 32), B_s64b(63 DOWNTO 32), Z, clk, S_s64b(63 DOWNTO 32), Cout_s64b);

END soma;