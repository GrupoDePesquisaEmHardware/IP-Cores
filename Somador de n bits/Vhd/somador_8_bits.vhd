---------------------------------------------------------------------------------------------------
-- 
-- Autor(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Codificador(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Data: 17/10/2022
--
-- Organizaçao: Grupo de Pesquisa em Hardware - GPH
-- Instituiçao: Universidade Federal do Rio Grande do Norte - UFRN
-- 
-- Componente(s) eletronico(s): somador de 8 bits
--
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY somador_8_bits IS
PORT(
		A_s8b, B_s8b: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Cin_s8b: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		S_s8b: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		Cout_s8b: OUT STD_LOGIC
);
END somador_8_bits;


ARCHITECTURE soma OF somador_8_bits IS
	COMPONENT somador_4_bits
		PORT(
			A_s4b, B_s4b: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Cin_s4b: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			S_s4b: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			Cout_s4b: OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL Z: STD_LOGIC; -- Sinal do carry da parte LSB do bit
	
BEGIN 

z0: somador_4_bits PORT MAP(A_s8b(3 DOWNTO 0), B_s8b(3 DOWNTO 0), Cin_s8b, clk, S_S8b(3 DOWNTO 0), Z);
z1: somador_4_bits PORT MAP(A_S8b(7 DOWNTO 4), B_S8b(7 DOWNTO 4), Z, clk, S_S8b(7 DOWNTO 4), Cout_s8b);

END soma;
