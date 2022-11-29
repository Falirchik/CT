%%Можно запускать секциями в editor -> run section
%% Построение матрицы управляемости
A = [1 2 3
    1 2 2
    0 3 4]

B = [-1
    1
    0]

C = [B A*B A^2*B]
rg = rank(C)
%% Проверка стабилизируемости системы

S = [-1     2    0
     0    -1     0
     1    -1     1]

S_inv = inv(S)
 
A_domic = S_inv*A*S
B_domic = S_inv*B
%% проверка на стабилизируемость неуправляемой части 
%копировать неуправляемую часть матрицы

S_UnP= [3 1
    -17 -5];
p_UnP=poly(S_UnP);
r=roots(p_UnP)
%% Форма Фробениуса

p=poly(A)   %коэфициенты полинома
r=roots(p)  %спектр собственных чисел
%% 
A_volna =[0    1    0;
          0     0    1;
          3 -6 7]
B_volna = [0
           0
           1]
      
C_volna = [B_volna A_volna*B_volna A_volna^2*B_volna]
C_volna_inv = inv(C_volna)
C_inv=inv(C);
p=C_volna*C_inv;

A_volna2=p*A*inv(p)

%% Качение через Фробениуса
C_volna
C_volna_inv
S_Frob=C*C_volna_inv
S_Frob_inv =inv(S_Frob)
%% ручками считаем Q_volna
Q_volna = [-9 -5 -13]
Q=Q_volna*S_Frob_inv

%% Через формулу Аккермана
C_inv = inv(C)
z_A=A^3+6*A^2+11*A+6*eye(3) %коэффициенты вбиваем, какие хотим получить по желаемому характерестическому полиному!
e=[0 0 1];
Q_A=-e*C_inv*z_A