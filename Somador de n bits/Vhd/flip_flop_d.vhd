---------------------------------------------------------------------------------------------------
-- 
-- Autor(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Codificador(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Data: 17/10/2022
--
-- Organizaçao: Grupo de Pesquisa em Hardware - GPH
-- Instituiçao: Universidade Federal do Rio Grande do Norte - UFRN
-- 
-- Componente(s) eletronico(s): flip-flop D
--
---------------------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY flip_flop_D IS
PORT(
	d_ffd, clk_ffd: IN STD_LOGIC;
	q_ffd, qb_ffd: OUT STD_LOGIC
);
END flip_flop_D;


ARCHITECTURE logic of  flip_flop_D IS
SIGNAL p_nand1, p_nand2, p_nand3, p_nand4,
		 p_not1: STD_LOGIC;
BEGIN
	
p_not1 <= NOT d_ffd;	
	
p_nand1 <= d_ffd NAND clk_ffd;
p_nand2 <= p_not1 NAND clk_ffd;
p_nand3 <= p_nand1 NAND p_nand4;
p_nand4 <= p_nand2 NAND p_nand3;

q_ffd<= p_nand3;
qb_ffd<= p_nand4;
	
END logic;
