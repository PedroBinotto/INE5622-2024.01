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
# parser.y: aviso: 17 conflitos de deslocamento/redução [-Wconflicts-sr]
# parser.y: aviso: 32 conflitos de redução/redução [-Wconflicts-rr]
# parser.y: nota: execute novamente com a opção "-Wcounterexamples" para gerar contraexemplos de conflito
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
# > T_IDENTT_EQUALS_SIGNT_IDENTT_OPEN_PARENT_CLOSE_PARENT_SEMICOLON
# > ^C
user@linux ➜ src $ ./xpp.out < test.xpp
# T_FUNCDEFT_IDENTT_OPEN_PARENT_INTT_IDENTT_COMMAT_INTT_IDENTT_CLOSE_PAREN[...]
```
