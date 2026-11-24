---
tipo: conceito
atualizado: 2026-11-17
fontes: [gist-karpathy-llm-wiki]
---

# LLM Wiki

Padrão de base de conhecimento pessoal em que o LLM **compila** as fontes num wiki de markdown e o mantém atualizado, em vez de buscar trechos nas fontes a cada pergunta (RAG). Criado por Andrej Karpathy ([gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)).

## A ideia

- **RAG redescobre; o wiki acumula.** No RAG, uma pergunta que cruza cinco documentos obriga o LLM a remontar tudo de novo. No LLM Wiki, as ligações e as contradições já estão feitas, e a síntese já reflete tudo o que foi lido.
- **Papéis:** o humano cura as fontes, dirige a análise, pergunta e pensa no que tudo significa. O LLM faz o resto.
- "O Obsidian é a IDE, o LLM é o programador, o wiki é o codebase."

## Estrutura

| Camada | O que é | Quem escreve |
|---|---|---|
| Fontes brutas | documentos originais, imutáveis; a fonte da verdade | ninguém (o LLM só lê) |
| Wiki | resumos, entidades, conceitos, comparações, síntese | só o LLM |
| Schema | `CLAUDE.md` com estrutura, convenções e fluxos | humano e LLM, juntos |

Arquivos-guia: `index.md` (catálogo por conteúdo, lido primeiro em toda pergunta) e `log.md` (cronológico, só acrescenta, prefixo `## [data] tipo | título`).

## Operações

- **Ingest:** uma fonte por vez, com o humano junto. Toca de 10 a 15 páginas.
- **Query:** responde citando páginas; resposta boa vira página nova.
- **Lint:** contradições, afirmações superadas, órfãs, conceitos sem página, ligações faltando, lacunas.

## Como evitar que vire lixo

O Karpathy não trata do assunto de forma direta. A defesa está no próprio padrão:
1. O ingest **integra** em páginas existentes; fonte que vira arquivo solto é RAG disfarçado.
2. O humano filtra no ingest (diz o que enfatizar).
3. O lint faz a faxina.
4. Quando aparece bagunça, a regra nova vai para o schema.

Escala: o `index.md` basta até ~100 fontes e algumas centenas de páginas. Depois, busca local (qmd ou script próprio).

## Para mim

- É a base deste wiki (`wiki/`): o que eu estudo, compilado num lugar só, para eu entender e para o Claude trabalhar com o meu jeito de pensar.
- Filtro: toda página tem que servir para aprender ou dar contexto ao Claude. O que não serve não entra.
- Duplicação em escala: resolver com programação (busca local e detecção de duplicata) quando o índice não bastar.
