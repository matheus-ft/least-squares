# MS512-P1

## (a) Cholesky

### `linear_sys.m`

Essa funcao resolve um sistema *Ax = b* usando a decomposição de Cholesky. Ela recebe uma matriz simetrica `A` e o vetor resposta `b`, performa a decomposicao (implementada em `cholesky.m`) e retorna uma solucao `x` apos reolver dois sistemas triangulares.

### `cholesky.m`

Essa funcao recebe uma matriz simetrica `A` e retorna o fator de Cholesky `R`, caso `A` seja positiva-definida; caso contrario, retorna um erro.

### `backward_subs.m`

Funcao implementada para resolver sistemas lineares com matrizes triangulares superiores. Util para item (b) tambem.

---

## (b) Quadrados Minimos

### `main.m`

Funcao que deve ser rodado para gerar os resultados apresentados no relatorio. Parametros:

- `method`: string (indiferente a maiuscula ou minuscula) indicando o metodo de solucao do problema de quadrados minimos

  - "QR" indica que sera utilizado  o algoritmo em `LS_QR.m`
  - "Cholesky" ou "chol" indica que sera utilizado o algoritmo em `LS_cholesky.m`

- `file`: string com o nome completo do arquivo que contem os dados para serem ajustados (dados capturados por `grab_data.m`)

### `LS_QR.m`

Funcao que calcula a solucao de quadrados minimos `x` (e seu residuo `r`) do probelma *Ax = b*. Recebe a matriz `A` e o vetor `b`, performa a decomposicao QR do Octave em `A` e soluciona o sistema linear *Rx = Q'b* com `backward_subs.m` - sendo *A = QR* e `R` triangular superior (quadrada apos ignorar as linhas de zeros).

### `LS_cholesky.m`

Funcao que calcula a solucao de quadrados minimos `x` (e seu residuo `r`) do probelma *Ax = b*. Recebe a matriz `A` e o vetor `b` e resolve as equacoes normais dadas por *A'Ax = A'b*  com `linear_sys.m`, o qual, por sua vez, aplica a decomposicao de Cholesky do item anterior para solucionar o sistema linear.
