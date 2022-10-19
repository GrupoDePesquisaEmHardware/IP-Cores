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
		A_di7s, B_di7s, C_di7s, D_di7s: IN STD_LOGIC;
		L1, L2, L3, L4, L5, L6, L7: OUT STD_LOGIC
	);
END display_7segmentos;


ARCHITECTURE logic OF display_7segmentos IS
SIGNAL p_and1, p_and2, p_and3, p_and4, p_and5, p_and6, p_and7, p_and8, 
		 p_and9, p_and10, p_and11, p_and12, p_and13, p_and14, p_and15, p_and16, 
		 p_and17, p_and18, p_and19, p_and20, p_and21, p_and22, p_and23, p_and24,
		 p_OR1, p_OR2, p_OR3, p_OR4, p_OR5, p_OR6, p_OR7: STD_LOGIC;
BEGIN

p_and1 <= B_di7s AND (NOT C_di7s) AND D_di7s;
p_and2 <= (NOT B_di7s) AND (NOT D_di7s);
p_and3 <= (NOT A_di7s) AND C_di7s;
p_and4 <= A_di7s AND (NOT B_di7s);
p_and5 <= A_di7s AND (NOT C_di7s);
p_and6 <= (NOT A_di7s) AND (NOT C_di7s) AND (NOT D_di7s);
p_and7 <= (NOT A_di7s) AND C_di7s AND D_di7s;
p_and8 <= A_di7s AND C_di7s AND (NOT D_di7s);
p_and9 <= (NOT A_di7s) AND (NOT B_di7s);
p_and10 <= (NOT B_di7s) AND (NOT C_di7s);
p_and11 <= (NOT A_di7s) AND D_di7s;
p_and12 <= (NOT A_di7s) AND B_di7s;
p_and13 <= (NOT A_di7s) AND B_di7s AND (NOT C_di7s) AND D_di7s;
p_and14 <= (NOT A_di7s) AND (NOT B_di7s) AND (NOT D_di7s);
p_and15 <= (NOT A_di7s) AND (NOT B_di7s) AND C_di7s;
p_and16 <= (NOT A_di7s) AND C_di7s AND (NOT D_di7s);
p_and17 <= A_di7s AND (NOT C_di7s) AND (NOT D_di7s);
p_and18 <= A_di7s AND C_di7s AND D_di7s;
p_and19 <= C_di7s AND (NOT D_di7s);
p_and20 <= A_di7s AND C_di7s;
p_and21 <= A_di7s AND B_di7s;
p_and22 <= (NOT C_di7s) AND (NOT D_di7s);
p_and23 <= B_di7s AND (NOT C_di7s);
p_and24 <= B_di7s AND (NOT D_di7s);

p_OR1 <= p_and1 OR p_and2 OR p_and3 OR p_and4 OR p_and5;
p_OR2 <= p_and6 OR p_and7 OR p_and8 OR p_and9 OR p_and10;
p_OR3 <= p_and8 OR p_and10 OR p_and11 OR p_and12;
p_OR4 <= p_and13 OR p_and14 OR p_and15 OR p_and16 OR p_and17 OR p_and18;
p_OR5 <= p_and2 OR p_and19 OR p_and20 OR p_and21;
p_OR6 <= p_and22 OR p_and23 OR p_and24 OR A_di7s;
p_OR7 <= p_and5 OR p_and15 OR p_and19 OR p_and23;

L1 <= NOT p_OR1;
L2 <= NOT p_OR2;
L3 <= NOT p_OR3;
L4 <= NOT p_OR4;
L5 <= NOT p_OR5;
L6 <= NOT p_OR6;
L7 <= NOT p_OR7;

END logic;
