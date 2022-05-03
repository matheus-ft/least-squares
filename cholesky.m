function R = cholesky(A)
% A is a symmetric, thus square, matrix

	n = rows(A);
	R = zeros(n);

	for i = 1 : n
		for j = 1 : n

			% fill the diagonal of the Cholesky factor
			if (i == j)
				sum = 0;
				for k = 1 : i-1
					sum += R(k, i) ^ 2;
				endfor
				% checks if the matrix A is positive definite
				if (sum >= A(i, i))
					error("A is not positive definite");
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
