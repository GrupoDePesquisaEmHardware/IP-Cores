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

ENTITY somador_2_bits IS
PORT(
	A_s2b, B_s2b: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	Cin_s2b: IN STD_LOGIC;
	clk: IN STD_LOGIC;
	S_s2b: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
	Cout_s2b: OUT STD_LOGIC
);
END somador_2_bits;


ARCHITECTURE soma OF somador_2_bits IS
	COMPONENT somador_completo
		PORT(
			A_sc, B_sc, Cin_sc: IN STD_LOGIC;
			S, Cout: OUT STD_LOGIC
		);
	END COMPONENT;
	COMPONENT flip_flop_D
		PORT(
			d_ffd, clk_ffd: IN STD_LOGIC;
			q_ffd, qb_ffd: OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL Z: STD_LOGIC; -- Sinal de saida do carry do somador
	SIGNAL X: STD_LOGIC_VECTOR (1 DOWNTO 0); -- Sinal de saida do registor A
	SIGNAL Y: STD_LOGIC_VECTOR (1 DOWNTO 0); -- Sinal de saida do registor B
	
BEGIN 

x0: flip_flop_D PORT MAP(A_s2b(0), clk, X(0), OPEN);
x1: flip_flop_D PORT MAP(A_s2b(1), clk, X(1), OPEN);

y0: flip_flop_D PORT MAP(B_s2b(0), clk, Y(0), OPEN);
y1: flip_flop_D PORT MAP(B_s2b(1), clk, Y(1), OPEN);

z0: somador_completo PORT MAP(X(0), Y(0), Cin_s2b, S_s2b(0), Z);
z3: somador_completo PORT MAP(X(1), Y(1), Z, S_s2b(1), Cout_s2b);

END soma;
