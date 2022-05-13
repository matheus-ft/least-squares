function [x, r] = LS_cholesky(filename)
    [A, b] = grab_data(filename);

    # solution for the normal equations
    x = linear_sys(A'*A, A'*b);
    r = norm(A*x - b, 2);
endfunction
