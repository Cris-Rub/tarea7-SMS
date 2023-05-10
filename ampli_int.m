function dx = ampli_int(t, x)
    %% PARAMETOS
    R1 =1000;
    R2 = 1000;
    R3 = 10000;
    R4 = 15000;
    C1 = 0.1e-6;
    C2 = 0.1e-6;

    beta = (R3+R4)/R3;
    alpha1 = beta/(R1*R2*C1*C2);
    gamma1 = (1/(R1*C1))+((1-beta)/(R2*C2))+(1/(R2*C1));
    tau1 = 1/(R1*R2*C1*C2);
    
    %% DINAMICA DEL SISTEMA
    dx = zeros(2, 1);
    
    %% MATRICES
    A = [0 1; -tau1 -gamma1];
    B = [0; alpha1];
    
    dx(1:2) = A*[x(1); x(2)]+B;
end