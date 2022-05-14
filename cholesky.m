function R = cholesky(A)
    n = rows(A);
    R = zeros(n);
    for i = 1:n
        for j = 1:i-1
            A(i,i) = A(i,i)-A(j,i)*A(j,i);
        end
        if(A(i,i) <= 0)
            message = 'ERROR: matrix not positive definite';
            error(message);
            break
        else
            R(i,i) = sqrt(A(i,i));
        end
    for j = i+1:n
        for k = 1:i-1
            A(i,j) = A(i,j) - A(k,i)*A(k,j);
        end
        R(i,j) = A(i,j)/A(i,i);
    end
end
