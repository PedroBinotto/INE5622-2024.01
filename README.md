# INE5622-2024.01

### Trabalho final da disciplina de Introdução a Compiladores

Analisador Léxico + Analisador Sintático implementados via Flex + Bison.

---

## Instruções de execução do projeto

Pré-requisitos:

- [Flex](https://github.com/westes/flex);
- [Gnu Bison](https://www.gnu.org/software/bison/);
- [GCC](https://gcc.gnu.org/);
- [GNU Make](https://www.gnu.org/software/make/);

É necessário instalar estas dependências através do gerenciador de pacotes do seu sistema operacional antes de tentar compilar o projeto.

---

Para compilar o projeto, basta executar o comando `make` no diretório `src` do projeto:

```bash
# pwd: [...]/INE5622-2024.01/src
user@linux ➜ src $ make
# bison -t -v -d parser.y
# flex lexer.l
# gcc -o xpp.out parser.tab.c lex.yy.c
```

Em seguida, é possível executar a análise de código da gramática "`x++`" diretamente ou através de arqvuivos de código:

```bash
# pwd: [...]/INE5622-2024.01/src
user@linux ➜ $ src ./xpp.out
# > int D;
# > T_INTT_IDENTT_SEMICOLON
# > D = func();
# > T_IDENT T_EQUALS_SIGN T_IDENT T_OPEN_PAREN T_CLOSE_PAREN T_SEMICOLON
# > ^C
user@linux ➜ src $ ./xpp.out < ./test-sources/test_1.lsi
# T_FUNCDEF T_IDENT T_OPEN_PAREN T_INT T_IDENT T_COMMA T_INT T_IDENT T_CLOSE_PAREN[...]
```

Os testes também podem ser executados automaticamente através do script incluido:

```bash
# pwd: [...]/INE5622-2024.01/src
user@linux ➜ $ ./run_tests
# =========================================
# Executando arquivo de teste './test-sources/test_1.lsi'
# T_FUNCDEF T_IDENT T_OPEN_PAREN T_CLOSE_PAREN ...
#
# =========================================
# Executando arquivo de teste './test-sources/test_2.lsi'
# ...
```
