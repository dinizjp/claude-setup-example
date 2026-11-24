# Wiki: regras

Minha base de conhecimento. Segue o padrão **LLM Wiki** do Andrej Karpathy ([gist original](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), resumo em [[llm-wiki]]): o Claude escreve e mantém o wiki; eu trago as fontes, faço as perguntas e decido o que enfatizar.

O conhecimento **se acumula**: cada fonte nova melhora as páginas que já existem, em vez de virar mais um arquivo solto. O wiki serve para eu entender os fundamentos e para o Claude trabalhar com o meu jeito de pensar.

## Filtro: o wiki não é depósito

- Fonte nova **integra** páginas que já existem. Página nova só quando o assunto não cabe em nenhuma.
- O que não serve para aprender ou dar contexto fica fora.
- No lint, propor fundir duplicatas e apagar páginas sem uso. Eu decido.

## As camadas

| Camada | Onde | Quem escreve |
|---|---|---|
| Fontes brutas | `brutos/` (vídeos transcritos, artigos, threads) | ninguém; o Claude só lê |
| Wiki | `wiki/` (esta pasta) | só o Claude |
| Regras | este arquivo | o Claude e eu, juntos, conforme o uso |

## Estrutura

- `index.md`: catálogo de todas as páginas, uma linha cada. **Ler primeiro em toda consulta.**
- `log.md`: histórico. Só se acrescenta. Cada entrada começa com `## [AAAA-MM-DD] tipo | título` (tipos: `ingest`, `query`, `lint`, `regras`).
- `fontes/`: uma página por fonte, com resumo, ideias principais e o que eu achei.
- `pessoas/`: autores que eu acompanho e o que defendem.
- `conceitos/`: ideias reutilizáveis.
- `temas/`: sínteses que cruzam várias fontes, sempre com uma seção "Para mim" (o que aplicar nos meus projetos).
- **Fila:** no gestor de tarefas, um projeto Wiki. Cada fonte é uma issue: Backlog = na fila, In Progress = em conversa, Done = entrou no wiki.

## Convenções

- Linguagem simples. Termos técnicos no original.
- Nome de arquivo em kebab-case, sem acento: `conceitos/llm-wiki.md`.
- Links internos no formato do Obsidian: `[[nome-do-arquivo]]`, sem a pasta.
- Toda afirmação importante cita a fonte: `([[fonte-x]])`.
- Contradição entre fontes não se apaga: vai para uma seção "Divergências".
- Cabeçalho de toda página:
  ```
  ---
  tipo: fonte | pessoa | conceito | tema
  atualizado: AAAA-MM-DD
  fontes: [fonte-a, fonte-b]
  ---
  ```
- Nunca entram senhas, chaves ou dados de terceiros.

## Operações

### Captura (link novo, sem conversa)
1. Salvar a fonte bruta em `brutos/`.
2. Criar a issue no projeto Wiki, em Backlog, com o link e a minha nota.
3. Responder em uma linha. Sem resumo e sem página nova.

### Ingest (fonte da fila)
**Uma fonte por vez, com conversa.** O objetivo é eu entender, não só arquivar.
1. Ler a fonte bruta.
2. Mostrar de 3 a 5 ideias principais, o que conecta com o wiki e o que diverge. Perguntar o que eu achei. **Esperar a resposta** antes de escrever.
3. Criar `fontes/<data>_<slug>.md`, com a minha opinião numa seção "O que eu achei".
4. Atualizar ou criar as páginas de pessoa, conceito e tema que a fonte toca.
5. Atualizar `index.md` e `log.md`. Commit.

### Query (pergunta)
1. Ler `index.md`, depois as páginas relevantes.
2. Responder citando as páginas.
3. Resposta útil e reaproveitável vira página nova em `temas/`.

### Lint (quando eu pedir ou a cada ~10 ingests)
Procurar contradições, afirmações superadas, páginas órfãs, duplicatas e conceitos sem página. Sugerir novas fontes e perguntas.

## Escala

Até ~150 páginas, o `index.md` basta. Passando disso, criar uma busca local e anotar a mudança aqui.
