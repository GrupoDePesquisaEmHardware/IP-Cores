---------------------------------------------------------------------
-- 
-- Autor(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Codificador(es): Laissa M A Gabinio e Otavio A C Barbosa
-- Data: 21/09/2022
--
-- Organizaçao: Grupo de Pesquisa em Hardware - GPH
-- Instituiçao: Universidade Federal do Rio Grande do Norte - UFRN
-- 
-- Componente(s) eletronicos: display de 7 segmentos(516AS)
--
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY display_7segmentos IS
PORT( 
		A_di7s, B_di7s, C_di7s, D_di7s: IN std_logic;
		L1, L2, L3, L4, L5, L6, L7: OUT std_logic
	);
END display_7segmentos;


ARCHITECTURE logic OF display_7segmentos IS
SIGNAL P_AND1, P_AND2, P_AND3, P_AND4, P_AND5, P_AND6, P_AND7, P_AND8, 
		 P_AND9, P_AND10, P_AND11, P_AND12, P_AND13, P_AND14, P_AND15, P_AND16, 
		 P_AND17, P_AND18, P_AND19, P_AND20, P_AND21, P_AND22, P_AND23, P_AND24,
		 P_OR1, P_OR2, P_OR3, P_OR4, P_OR5, P_OR6, P_OR7: std_logic;
BEGIN

P_AND1 <= B_di7s and (not C_di7s) and D_di7s;
P_AND2 <= (not B_di7s) and (not D_di7s);
P_AND3 <= (not A_di7s) and C_di7s;
P_AND4 <= A_di7s and (not B_di7s);
P_AND5 <= A_di7s and (not C_di7s);
P_AND6 <= (not A_di7s) and (not C_di7s) and (not D_di7s);
P_AND7 <= (not A_di7s) and C_di7s and D_di7s;
P_AND8 <= A_di7s and C_di7s and (not D_di7s);
P_AND9 <= (not A_di7s) and (not B_di7s);
P_AND10 <= (not B_di7s) and (not C_di7s);
P_AND11 <= (not A_di7s) and D_di7s;
P_AND12 <= (not A_di7s) and B_di7s;
P_AND13 <= (not A_di7s) and B_di7s and (not C_di7s) and D_di7s;
P_AND14 <= (not A_di7s) and (not B_di7s) and (not D_di7s);
P_AND15 <= (not A_di7s) and (not B_di7s) and C_di7s;
P_AND16 <= (not A_di7s) and C_di7s and (not D_di7s);
P_AND17 <= A_di7s and (not C_di7s) and (not D_di7s);
P_AND18 <= A_di7s and C_di7s and D_di7s;
P_AND19 <= C_di7s and (not D_di7s);
P_AND20 <= A_di7s and C_di7s;
P_AND21 <= A_di7s and B_di7s;
P_AND22 <= (not C_di7s) and (not D_di7s);
P_AND23 <= B_di7s and (not C_di7s);
P_AND24 <= B_di7s and (not D_di7s);

P_OR1 <= P_AND1 or P_AND2 or P_AND3 or P_AND4 or P_AND5;
P_OR2 <= P_AND6 or P_AND7 or P_AND8 or P_AND9 or P_AND10;
P_OR3 <= P_AND8 or P_AND10 or P_AND11 or P_AND12;
P_OR4 <= P_AND13 or P_AND14 or P_AND15 or P_AND16 or P_AND17 or P_AND18;
P_OR5 <= P_AND2 or P_AND19 or P_AND20 or P_AND21;
P_OR6 <= P_AND22 or P_AND23 or P_AND24 or A_di7s;
P_OR7 <= P_AND5 or P_AND15 or P_AND19 or P_AND23;

L1 <= not P_OR1;
L2 <= not P_OR2;
L3 <= not P_OR3;
L4 <= not P_OR4;
L5 <= not P_OR5;
L6 <= not P_OR6;
L7 <= not P_OR7;

END logic;
