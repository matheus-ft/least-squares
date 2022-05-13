function x = backward_subs(A, b)
    n = rows(A);
    x = zeros(n, 1);
    for i = n : -1 : 1  # for i in range(n, 0, -1)
        summation = 0;
        for j = n : -1 : i+1
            summation += x(j) * A(i, j);
        endfor
        x(i) = (b(i) - summation) / A(i, i);
    endfor
endfunction
