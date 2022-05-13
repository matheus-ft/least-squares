function main(method, file)
    method = tolower(method);
    if (strcmp(method, "qr"))  % opposite return value of the <string.h> function
        [A, b] = grab_data(file);
        [x, r] = LS_QR(A, b);

        printf("\nAjustando os dados de %s por um polinômio de grau 10.\nResolvemos o problema de quadrados mínimos utilizando a decomposição QR diretamente na matriz do sistema.\n\n", file);
        printf("Numero de condicao: k(A) = %d \n\n", cond(A));
        disp("Solucao: \nx = "), disp(x), disp("\n");
        printf("Residuo: ||Ax-b|| = %f \n", r);

        plot(A*x, "-;Least Squares Solution;", "linewidth", 2, b, ".;Data;");

    elseif (strcmp(method, "cholesky") || strcmp(method, "chol"))
        [A, b] = grab_data(file);
        [x, r] = LS_cholesky(A, b);

        printf("\nAjustando os dados de %s por um polinômio de grau 10.\nResolvemos o problema de quadrados mínimos utilizando decomposição de Cholesky para resolver as equações normais.\n\n", file);
        printf("Numero de condicao: k(A) = %d \n\n", cond(A));
        disp("Solucao: \nx = "), disp(x), disp("\n");
        printf("Residuo: ||Ax-b|| = %f \n", r);

        plot(A*x, "-;Least Squares Solution;", "linewidth", 2, b, ".;Data;");

    else 
        disp("\nEste método não é válido!\n");
    endif
endfunction
