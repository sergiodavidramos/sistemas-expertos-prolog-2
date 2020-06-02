/*
En la primera familia,
    � el padre es Tom�s Garc�a P�rez, nacido el 7 de Mayo de 1960, trabaja de profesor y gana 60
        euros diarios;
    � la madre es Ana L�pez Ruiz, nacida el 10 de marzo de 1962, trabaja de m�dica y gana 90
        euros diarios;
    � el hijo es Juan Garc�a L�pez, nacido el 5 de Enero de 1980, estudiante;
    � la hija es Mar�a Garc�a L�pez, nacida el 12 de Abril de 1992, estudiante.
En la segunda familia,
    � el padre es Jos� P�rez Ruiz, nacido el 6 de Marzo de 1963, trabaja de pintor y gana 120
        euros diarios;
    � la madre es Luisa G�lvez P�rez, nacida el 12 de Mayo de 1964, trabaja de m�dica y gana 90
        euros diarios;
    � un hijo es Juan Luis P�rez P�rez, nacido el 5 de Febrero de 1990, estudiante;
    � una hija es Mar�a Jos� P�rez P�rez, nacida el 12 de Junio de 1992, estudiante;
    � otro hijo es Jos� Mar�a P�rez P�rez, nacido el 12 de Julio de 1994, estudiante.
*/

familia(
    persona(
        [tomas, garcia, perez],
        fecha(7,mayo, 1960),
        trabaja(profesor, 60)),  %->papa

    persona(
        [ana, lopez, ruiz],
        fecha(10, marzo, 1962),
        trabaja(medico,90)),  %->mama
    [
        persona([juan, garcia, lopez], fecha(5, enero, 1980), estudiante),
        persona([maria, garcia, lopez], fecha(12, abril, 1992), estudiante)
    ] %->hijos
).
familia(
    persona(
        [jose, perez, ruiz],
        fecha(6,marzo, 1963),
        trabaja(pintor, 120)),  %->papa

    persona(
        [luisa, galvez, perez],
        fecha(12, mayo, 1964),
        trabaja(medico,90)),  %->mama
    [
        persona([juan_luis, perez, perez], fecha(5, febrero, 1990), estudiante),
        persona([maria_jose, perez, perez], fecha(12, junio, 1992), estudiante),
        persona([jose_maria, perez, perez], fecha(12, julio, 1994), estudiante)
     ] %->hijos
).
familia(
    persona(
        [pedro, soliz, mamani],
        fecha(15, abril, 1989),
        trabaja(policia, 50)
    ),
    persona(
        [sonia, postelo, erquicial],
        fecha(23, febrero, 1995),
        estudiante
    ),
    []
).

/* Total de sueldo de todos los padres por dia */
total:-write("funciona"),nl,
    findall(G,familia(persona(_,_,trabaja(_,G)),_,_),L),
    suma(L,T),
    write("La suma total de sueldo de los papas es: "),
    write(T).


%suma([],0).
%suma(A,R):-length(A)<=0, R is 0.
%suma([L|B],R):-
%    suma(B,R1),
%    R is L+R1.

/*Como saber si pertenece a una familia como hijo*/
 soyHijo(X):- familia(_,_,Hijos), member(X,Hijos).

/*Mostrar los padre que ganen > 90*/

gananMayor(P,M):-
    familia(persona([P,_,_],_,trabaja(_,G)),_,_),G>=60;
    familia(_,persona([M,_,_],_,trabaja(_,G)),_,_),G>=60.



personas(X):-
    soyHijo(X);
    familia(X,_,_);
    familia(_,X,_).

fecha_nac(persona(_,Y,_),Y).
separaNombre(persona(N,_,_),N).

/*Lista los que son menores a 1990*/
lista(T):-personas(X),fecha_nac(X,fecha(_,_,Anio)),Anio<1990, separaNombre(X,T).

/*sumaPro([],0,_):-!.
sumaPro([H|C],R,Cont):-
    sumaPro(C,R1,Total),
    Total is Cont+1,
    R is H + R1.*/


/*El promedio de sueldo por familia.*/
suma([],0).
suma([L|B],R):-
    suma(B,R1),
    R is L+R1.

contar(A,R):-length(A,R).
promedio(R):-write("Promedio de sueldos"),nl,
   findall(G, familia(persona(_,_, trabaja(_,G)),_,_),L),
   findall(T, familia(_,persona(_,_, trabaja(_,T)),_),M),
   contar(L,R3),
   suma(L,R1),
   suma(M,R2),
   R is (R1+R2)/R3.

/*Sacar el promedio de hijos por familia.*/
promedioHijos(C):- write("Promedio de hijos por familia"),nl,
    findall(G, familia(_,_,G),L),
    pro(L,O),
    length(L,P),
    C is O/P.

pro([],0).
pro([A|B],C):-
    length(A,R),
       pro(B,M),
        C is R+M.



%Realiza la suma de numeros pares de una lista.

modulo(X) :-
Y is mod(X,2),
Y =:= 0.

add(X) :-
Y is X + 1,
modulo(Y).

sum_pares([],0).
sum_pares([H|T],X) :-
modulo(H),
sum_pares(T, Y),
X is Y+H.
sum_pares([H|T],X) :-
add(H),
sum_pares(T, X).



%Encontrar el maximo numero de una lista
max([X|Xs],M):-
          max2(Xs,M,X).
max2([],M,M):- !.

max2([Z|Zs],X,Y):-
          Z >= Y,
          !,
          max2(Zs,X,Z).
max2([Z|Zs],X,Y):-
          Z =< Y,
          max2(Zs,X,Y).


/*
      |  3x + 1, si x es impar;

f(x) =|

      |  x/2, si x es par
*/


ejem3(X,R):-
    Y is mod(X,2),
     (  Y=:=0
    ->R is (X/2)
    ; R is (3*X)+1
     ).

%genera lo n primeros elementos

generar(N,_) :- N is 1.
generar(N,R) :- generar(M,R),N is M + 1, (N<R+1->true; !).


/* Resolucion de la practica de arriba*/
/* Realiza la suma de numeros pares de una lista*/

suma_r1(X,T):- between(1,X,T),
    (T mod 2 =:=0, write(T)).

