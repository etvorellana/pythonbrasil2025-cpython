# CPython, Python e sua aplicação de alto desempenho
### Python Brasil 2025 — Esbel Tomas Valero Orellana

Este repositório contém os materiais da palestra **"CPython, Python e sua aplicação de alto desempenho"** apresentada na **Python Brasil 2025**.  
Inclui os slides da apresentação e um notebook Jupyter com exemplos práticos demonstrando o uso de **CPython**, **C/C++**, **OpenMP** e **CUDA** para aplicações de alto desempenho.

---

##  Conteúdo

- `Roteiro_PythonBrasil2025_CPython.pptx` — Roteiro base dos slides.
- `Notebook_PythonBrasil2025_CPython.ipynb` — Notebook Jupyter com exemplos executáveis.
- `mymatmul.c` — Código-fonte exemplo de módulo C para Python (gerado pelo notebook).
- `setup.py` — Script de compilação para a extensão nativa (gerado pelo notebook).

---

##  Requisitos

### Ambiente base
- Python 3.8+ 
- Compilador C compatível (`gcc`, `clang` ou `msvc`)
- Pacotes Python:
  ```bash
  pip install numpy matplotlib
  ```
- (Opcional) Para GPU:
  ```bash
  pip install cupy-cuda12x
  ```

---

## ⚙️Como usar o notebook

1. Clone este repositório:
   ```bash
   git clone https://github.com/<seu-usuario>/pythonbrasil2025-cpython.git
   cd pythonbrasil2025-cpython
   ```

2. Abra o notebook:
   ```bash
   jupyter notebook Notebook_PythonBrasil2025_CPython.ipynb
   ```

3. Execute as células sequencialmente.
   O notebook possui um modo **QUICK** que usa matrizes menores para testes rápidos:
   ```python
   QUICK = True  # definido nas primeiras células
   ```

4. Gere o módulo C:
   ```bash
   python setup.py build_ext --inplace
   ```

5. Teste a extensão compilada:
   ```python
   import mymatmul
   C = mymatmul.matmul_omp(A, B)
   ```

---

## Reproduzindo os benchmarks

O notebook executa benchmarks comparando:
- **Python puro** (loops)
- **NumPy (BLAS)**
- **Extensão C via CPython**
- (Opcional) **CuPy (GPU)**

Os resultados são apresentados em gráficos de tempo de execução (`matplotlib`).
Use o modo **completo** para matrizes maiores:

```python
QUICK = False
```

---

## Dica para performance

- Use `export OMP_NUM_THREADS=<n>` para definir o número de threads OpenMP.
- Em sistemas Linux/Mac, compile com `gcc -fopenmp` ou `clang -fopenmp`.
- Em Windows, use o compilador do Visual Studio (MSVC).

---

## Referências

- [Documentação oficial — CPython Extending and Embedding](https://docs.python.org/3/extending/)
- [NumPy C-API](https://numpy.org/doc/stable/reference/c-api/)
- [OpenMP](https://www.openmp.org/)
- [CuPy](https://cupy.dev/)

---

##  Licença

Este material é disponibilizado sob a licença **GPL v3**.
Sinta-se à vontade para usar, adaptar e contribuir!
