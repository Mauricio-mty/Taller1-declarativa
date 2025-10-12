% Inicio de base
es(merlon,mago).
es(aldara,aprendiz).
es(gorik,guerrero).
es(lyra,bibliotecaria).

sabe(merlon,razonamiento_simbolico).
sabe(merlon,transformar).
sabe(aldara,domina_logica).
sabe(gorik,estrategia).
sabe(gorik,conocimiento_colectivo).
sabe(lyra,registrar_con_precision).
sabe(lyra,historia).

amigo_de(merlon,gorik).
amigo_de(aldara,lyra).
amigo_de(gorik,lyra).

ensena(merlon,aldara).

ayuda_en(gorik,defensa_reino).
ayuda_en(aldara,crear_consultas).
ayuda_en(merlon,leyes_basicas).
ayuda_en(gorik,anadir_reglas).
ayuda_en(gorik,registrar_todo).
ayuda_en(lyra,registrar_todo).

%fin de base

%---------Reglas---------

%----R1----
sabio(X):-sabe(X,_),ensena(X,_).
%----R2----
estudioso(X):-es(X,aprendiz),sabe(X,_).

%----R3----
aliado(X,Y):-ayuda_en(X,Z),ayuda_en(Y,Z),X\=Y.

%----R4----
conocedor(X):-sabe(X,A),sabe(X,B), A\=B.
%----R5----
maestro(X):- ensena(X,_),\+ es(X,aprendiz).

%---------FIN Reglas---------


%---------Consultas---------
% ensena(Maestro,Aprendiz).
% ensena(merlon,X).
% aliado(X,Y).
% ensena(merlon,X),sabe(X,_).
% sabio(X),ayuda_en(X,Tarea).
%---------FIN Consultas---------

%--------Recursividad--------
%--------caso base
maestro_indirecto(X,Y):-ensena(X,Y).

%-------caso general
maestro_indirecto(X,Y):-
    ensena(X,Z),    
    maestro_indirecto(Z,Y).
%----consultas de ejemplo-----
% maestro_indirecto(merlon,aldara). true
% maestro_indirecto(merlon,aprendiz2).false
% maestro_indirecto(aldara,aprendiz2). false

%------corte------
consejo_principal(X) :-
    es(X, mago), !.
consejo_principal(X) :-
    es(X, aprendiz), !.
consejo_principal(X) :-
    es(X, bibliotecaria), !.
%consejo_principal(X).

%-----Fallo--------
mostrar_personajes :-
    es(X, _),
    write('Personaje: '), write(X), nl,
    fail. 
mostrar_personajes.
%mostrar_personajes
