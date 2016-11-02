x = {1 2 3 4 5};

for i = 1:length(x)
    y = x{i}
    x{length(x) + i} = 6;
endfor