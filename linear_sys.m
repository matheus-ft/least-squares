function x = linear_sys(A, b)
    # A is symmetric, thus, we try to find its Cholesky factor R
    # If A = RR', since Ax = b -> RR'x = b
    # Therefore, we want x: Ry = b and R'x = y
    R = cholesky(A);
    y = backward_subs(R, b);
    x = forward_subs(R', y);
endfunction

function x = forward_subs(A, b)
    n = rows(A);
    x = zeros(n, 1);
    for i = 1 : n
        summation = 0;
        for j = 1 : i-1
            summation += x(j) * A(i, j);
        endfor
        x(i) = (b(i) - summation) / A(i, i);
    endfor
endfunction
