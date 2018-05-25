function [slots] = simDisco(pp_1,pp_2,trials)
%simDisco Simulate Disco discovery using prime pairs pp1 and pp2
%   pp1 and pp2 must be of shape [p1,p2]
slots = zeros([trials, 1]);

for i = 1:trials
    disco = false;
    t0_1 = randi(1e6);
    t0_2 = randi(1e6);
    while(not(disco))
        slots(i) = slots(i) + 1;

        n1_on = (mod(slots(i)+t0_1, pp_1(1))==0) + (mod(slots(i)+t0_1, pp_1(2))==0);
        n2_on = (mod(slots(i)+t0_2, pp_2(1))==0) + (mod(slots(i)+t0_2, pp_2(2))==0);
        
        if and(n1_on, n2_on)
            disco = true;
        end
    end
end

end

