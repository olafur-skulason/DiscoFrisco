clc

Lambda0 = @(L) sqrt(L-3/4)+1/2;

% Birthday
Pr = 0.995;
p = 0.05;
L_b = log(1-Pr)/log(1-p^2)
PLP_b = p*L_b
Lambda_b = PLP_b/Lambda0(L_b)

%Quorum
m = 40;
L_q = m^2
PLP_q = 2*m-1
Lambda_q = PLP_q/Lambda0(L_q)

% Disco (37,43)(37,43)

p1 = 37;
p2=43;
L_d1 = p1*p2
PLP_d1 = p1+p2
Lambda_d1 = PLP_d1/Lambda0(L_d1)

% Disco (23,157) (29,69)

p1 = 23;
p2 = 29;
L_d2 = p1*p2
PLP_d2 = p1+p2
Lambda_d2 = PLP_d2/Lambda0(L_d2)
