---------------------------------------------------------------------------------------------------
-- 
-- Autor(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Codificador(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Data: 17/10/2022
--
-- Organizaçao: Grupo de Pesquisa em Hardware - GPH
-- Instituiçao: Universidade Federal do Rio Grande do Norte - UFRN
-- 
-- Componente(s) eletronico(s): somador 4 de bits
--
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY somador_4_bits IS
PORT(
	A_s4b, B_s4b: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Cin_s4b: IN STD_LOGIC;
	clk: IN STD_LOGIC;
	S_s4b: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
	Cout_s4b: OUT STD_LOGIC
);
END somador_4_bits;


ARCHITECTURE soma OF somador_4_bits IS
	COMPONENT somador_2_bits
		PORT(
			A_s2b, B_s2b: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			Cin_s2b: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			S_s2b: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			Cout_s2b: OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL Z: STD_LOGIC; -- Sinal de saida do carry do somador
	
BEGIN 

z0: somador_2_bits PORT MAP(A_s4b(1 DOWNTO 0), B_s4b(1 DOWNTO 0), Cin_s4b, clk, S_s4b(1 DOWNTO 0), Z);
z1: somador_2_bits PORT MAP(A_s4b(3 DOWNTO 2), B_s4b(3 DOWNTO 2), Z, clk, S_s4b(3 DOWNTO 2), Cout_s4b);

END soma;
