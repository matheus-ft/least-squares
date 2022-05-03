function R = cholesky(A)
	n = rows(A);  % safe, since we are assuming that A is symmetric, thus it is a square matrix
	R = zeros(n);

	for i = 1 : n
		for j = 1 : n
			% fill the diagonal of the Cholesky factor
			if (i == j)
				% sum of the square of the elements below the diagonal
				sum = 0;
				for k = 1 : i-1
					sum += R(k, i) ^ 2;
				endfor
				% checks if the matrix A is positive definite
				if (sum >= A(i, i))
					printf("%s\n", "A is not positive definite");
					return;
				endif
				R(i, i) = sqrt( A(i, i) - sum );
			
			% fill upper half of the Cholesky factor
			elseif (j > i)
				sum = 0;
				for k = 1 : i-1
					sum += R(k, i) * R(k, j);
				endfor
				R(i, j) = ( A(i, j) - sum ) / R(i, i);
			
			% bellow diagonal
			else
				R(i, j) = 0;
			endif
		endfor
	endfor

endfunction
