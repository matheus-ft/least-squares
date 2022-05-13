# MS512-P1

## (a) Cholesky

### `linear_sys.m`

Essa função resolve um sistema *Ax = b* usando a decomposição de Cholesky. Ela recebe uma matriz simétrica `A` e o vetor resposta `b`, performa a decomposição (implementada em `cholesky.m`) e retorna uma solução `x` após resolver dois sistemas triangulares.

### `cholesky.m`

Essa função recebe uma matriz simétrica `A` e retorna o fator de Cholesky `R`, caso `A` seja positiva-definida; caso contrário, retorna um erro.

### `backward_subs.m`

Função implementada para resolver sistemas lineares com matrizes triangulares superiores. Útil para item (b) também.

---

## (b) Quadrados Mínimos

### `main.m`

Função que deve ser rodada para gerar os resultados apresentados no relatório. Parâmetros:

- `method`: string (indiferente a maiuscula ou minuscula) indicando o método de solução do problema de quadrados mínimos

- "QR" indica que será utilizado  o algoritmo em `LS_QR.m`
- "Cholesky" ou "chol" indica que será utilizado o algoritmo em `LS_cholesky.m`

- `file`: string com o nome completo do arquivo que contém os dados para serem ajustados (dados capturados por `grab_data.m`)

### `LS_QR.m`

Funcao que calcula a solução de quadrados mínimos `x` (e seu resíduo `r`) do problema *Ax = b*. Recebe a matriz `A` e o vetor `b`, performa a decomposição QR do Octave em `A` e soluciona o sistema linear *Rx = Q'b* com `backward_subs.m` - sendo *A = QR* e `R` triangular superior (quadrada após ignorar as linhas de zeros).

### `LS_cholesky.m`

Funcao que calcula a solução de quadrados mínimos `x` (e seu resíduo `r`) do problema *Ax = b*. Recebe a matriz `A` e o vetor `b` e resolve as equações normais dadas por *A'Ax = A'b*  com `linear_sys.m`, o qual, por sua vez, aplica a decomposição de Cholesky do item anterior para solucionar o sistema linear.
