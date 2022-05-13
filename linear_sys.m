function x = linear_sys(A, b)
    R = cholesky(A);
    % A = RR' and Ax = b <-> RR'x = b <-> Ry = b and R'x = y
    y = backward_subs(R, b);
    x = forward_subs(R', y);
endfunction

function x = forward_subs(A, b)
    n = rows(A);
    x = zeros(n, 1);
    for i = 1 : n
        summation = 0;
        for j = 1 : i-1
            summation += x(j) * A(i, j)
        endfor
        x(i) = (b(i) - summation) / A(i, i)
    endfor
endfunction
