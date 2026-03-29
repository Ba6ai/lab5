DOMAINS
  listl = integer*

PREDICATES
  start
  in_list(integer, listl)
  member(integer, listl)
  intersect(listl, listl, listl)
  print_list(listl)

CLAUSES
  % Заполнение списка
  in_list(0, []) :- !.
  in_list(N, [H|T]) :-
    write("Enter element: "),
    readint(H),
    N1 = N - 1,
    in_list(N1, T).

  % Проверка: является ли элемент частью списка
  member(X, [X|_]) :- !.
  member(X, [_|T]) :- 
    member(X, T).

  % Нахождение пересечения
  % Если первый список пуст — пересечение пустое
  intersect([], _, []).
  
  % Если голова первого списка есть во втором — добавляем ее в результат
  intersect([H|T], L2, [H|Res]) :-
    member(H, L2), !,
    intersect(T, L2, Res).
    
  % Если головы первого списка нет во втором — пропускаем её
  intersect([_|T], L2, Res) :-
    intersect(T, L2, Res).

  % Вывод списка на экран
  print_list([]).
  print_list([H|T]) :-
    write(H, " "),
    print_list(T).

  start :-
    % Ввод кол-ва элементов первого множества
    write("Size of 1st set: "), 
    readint(N1),
    in_list(N1, L1),
    
    % Ввод кол-ва элементов второго множества
    write("Size of 2nd set: "), 
    readint(N2),
    in_list(N2, L2),
    
    % Поиск пересечения
    intersect(L1, L2, Result),
    
    % Вывод результата
    nl, write("Intersection: "),
    print_list(Result),
    nl.

GOAL
  start.
