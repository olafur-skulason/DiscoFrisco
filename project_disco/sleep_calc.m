% sleep time
clc
mpause = @(p)pause(1*p);

p = [7,11];

mem = p;

for i = 1:4
    slp = min(mem)
    mem = mem - slp;
    for j = 1:2
        if mem(j) == 0
            mem(j) = p(j);
        end
    end
end

