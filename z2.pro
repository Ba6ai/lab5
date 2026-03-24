DOMAINS
  listl = integer* % Список, элементы которого - целые числа

PREDICATES
  start
  in_list(integer, listl)
  search_list(listl)
  
ClAUSES
% Заполнение списка
  in_list(0, []) :- !.
  in_list(N, [H|T]) :-
    write("Enter count: "),
    readint(H),
    N1 = N - 1,
    in_list(N1, T).

% Проверка списка на возрастание
  search_list([]).	% Базовый случай: условия успешного завершения кода
  search_list([_]).	% Список из любого (_) элемента
  search_list([X, Y | Tail]) :-
    X <= Y,
    search_list([Y | Tail]).
  
  start :-
    write("Enter number of actions in list: "),
    readint(N),
    in_list(N, L),
    search_list(L),
    write("True"), nl; % двоеточие обозначает запасной вариант дальше по коду
    write("False").
    
GOAL
  start.