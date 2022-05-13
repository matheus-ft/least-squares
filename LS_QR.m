function [x, r] = LS_QR(A, b)    
    [Q, R] = qr(A);
    R = R(1:columns(R), :);  % then R is square (we're ignoring only zero lines)
    x = backward_subs(R, Q'*b);
    r = norm(A*x - b, 2);
endfunction
