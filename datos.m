clear all;
clc;

[t, x] = ode45(@ampli_int, [0 0.003], [0 0]);

%% PARAMETROS
R1 = 1000;
R2 = 1000;
R3 = 10000;
R4 = 15000;
C1 = 0.1e-6;
C2 = 0.1e-6;

beta = (R3+R4)/R3;
alpha1 = beta/(R1*R2*C1*C2);
gamma1 = (1/(R1*C1))+((1-beta)/(R2*C2))+(1/(R2*C1));
tau1 = 1/(R1*R2*C1*C2);

%% FUNCIÓN DE TRANSFERENCIA
G = tf(beta/(R1*R2*C1*C2), [1 (1/(R1*C1))+((1-beta)/(R2*C2))+(1/(R2*C1)) (1/(R1*R2*C1*C1))]);

%% GRAFICACIÓN DE RESULTADOS
figure;
plot(t, x(:, 1));
grid on
xlabel("Tiempo");
ylabel("Volts");

open('amplificador_2022b.slx');