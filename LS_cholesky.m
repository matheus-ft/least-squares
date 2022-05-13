function [x, r] = LS_cholesky(A, b)
    % solution x for the normal equations A'Ax = A'b
    x = linear_sys(A'*A, A'*b);
    r = norm(A*x - b, 2);
endfunction
