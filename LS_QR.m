function [x, r] = LS_QR(filename)
    [A, b] = grab_data(filename);
    
    [Q, R] = qr(A);
    x = backward_subs(R, Q'*b);
    r = norm(A*x - b, 2);
endfunction
