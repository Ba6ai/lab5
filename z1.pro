DOMAINS
  n = integer

PREDICATES
  start
  count_sum(n, n) % (число, сумма его чисел)
  curr_step_itg(n, n, n) % (Текущее число, Счётчик, Итог)

CLAUSES
% Вычисление суммы цифр числа
  count_sum(0, 0) :- !.
  count_sum(N, Sum) :-
    X = N mod 10,
    Y = N div 10,
    count_sum(Y, Z),
    Sum = Z + X.

% Вычисление кол-ва проходов до 0
  curr_step_itg(0, Steps, Steps) :- !.
  curr_step_itg(CurrentN, CurrentSteps, Total) :-
    count_sum(CurrentN, S),
    NewN = CurrentN - S,
    NextSteps = CurrentSteps + 1,
    curr_step_itg(NewN, NextSteps, Total).

  start :-
    write("Write count: "), readint(Input),
    curr_step_itg(Input, 0, Result),
    write("Number of actions: ", Result), nl.

GOAL
  start.