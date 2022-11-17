LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY somador_completo IS
PORT(
		A_sc, B_sc, Cin_sc: IN std_logic;
		S, Cout: OUT std_logic
);
END somador_completo;


ARCHITECTURE soma OF somador_completo IS
SIGNAL P_XOR1, P_XOR2,
		 P_AND1, P_AND2, P_AND3,
		 P_OR1: std_logic;
		 
		 
BEGIN

P_XOR1 <= B_sc xor Cin_sc;
P_XOR2 <= P_XOR1 xor A_sc;

P_AND1 <= A_sc and B_sc;
P_AND2 <= B_sc and Cin_sc;
P_AND3 <= A_sc and Cin_sc;

P_OR1 <= P_AND1 or P_AND2 or P_AND3;

S <= P_XOR2;
Cout <= P_OR1;

END soma;
