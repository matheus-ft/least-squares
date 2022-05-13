function R = cholesky(A)
% A is a symmetric, thus square, matrix

	n = rows(A);
	R = zeros(n);

	for i = 1 : n
		for j = 1 : n

			% fill the diagonal of the Cholesky factor
			if (i == j)
				summation = 0;
				for k = 1 : i-1
					summation += R(k, i) ^ 2;
				endfor
				% checks if the matrix A is positive definite
				if (summation >= A(i, i))
					error("A is not positive definite");
				endif
				R(i, i) = sqrt( A(i, i) - summation );

			% fill upper half of the Cholesky factor
			elseif (j > i)
				summation = 0;
				for k = 1 : i-1
					summation += R(k, i) * R(k, j);
				endfor
				R(i, j) = ( A(i, j) - summation ) / R(i, i);

			% bellow diagonal is already filled with zeros
			endif

		endfor
	endfor

endfunction
