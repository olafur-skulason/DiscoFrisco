%% Energy calculations

% primes
pp_1 = [23, 157]';
pp_2 = [29,67]';
%pp_2 = [23, 157]';

% duty cycles
DC1 = sum(1./pp_1)
DC2 = sum(1./pp_2)
DC = mean([DC1, DC2])

% Find prime pairs that meet in the worst case
pp_ws = NaN(2); %worst case pairs
for i = 1:2
    for j = 1:2
        if not(pp_1(i) == pp_2(j))
            pp_ws(i,j) = pp_1(i)*pp_2(j);
        end
    end
end

[minCol,i1] = min(pp_ws);
[~,     i2] = min(minCol);

p_1 = pp_1(i1(i2))
p_2 = pp_2(i2)

% Measured time
t_tosl = 0.000;     % to sleep
t_frsl = 0.000;     % from sleep
t_radio = 0.03;     % radio
t_slot = t_radio;
t_cycle = 1/DC * t_slot; %cycle
t_sleep = t_cycle - t_tosl - t_frsl;

% Measured energy consumption values
E_radio = 0.01;     
E_sleep = 0.001*t_sleep;   
E_tosl = 0.0005;      
E_frsl = 0.0005;     

E_cycle = E_tosl + E_frsl + E_radio + E_sleep;
E_slot_mean = E_cycle*DC

% Worst case latency
L_slots = p_1 * p_2
L = L_slots * t_slot 

% Power-latency product
PLP = E_cycle * DC * L_slots
Lambda = DC * L
Lambda0 = sqrt(L-3/4)+1/2
lambda = Lambda/Lambda0

