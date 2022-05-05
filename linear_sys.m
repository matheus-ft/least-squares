function x = linear_sys(A, b)
    R = cholesky(A);
    % A = RR' and Ax = b <-> RR'x = b <-> Ry = b and R'x = y
    y = backward(R, b);
    x = forward(R', y);
endfunction

function x = backward(A, b)
    n = rows(A);
    x = zeros(n, 1);
    for i = n : -1 : 1  % for i in range(n, 0, -1)
        summation = 0;
        for j = n : -1 : i+1
            summation += x(j) * A(i, j)
        endfor
        x(i) = (b(i) - summation) / A(i, i)
    endfor
endfunction

function x = forward(A, b)
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
