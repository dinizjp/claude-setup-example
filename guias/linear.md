# Linear como contexto entre sessões

O Claude não lembra da conversa anterior. Se o contexto de um projeto mora só na sua cabeça, você explica tudo de novo a cada sessão. Se mora num arquivo solto, ninguém atualiza. Eu guardo esse contexto no Linear, porque ele já é onde eu organizo o trabalho e o Claude lê e escreve nele pelo MCP.

Qualquer gestor de tarefas com MCP serve (Notion, Jira, GitHub Issues). Eu recomendo o Linear porque a estrutura dele (times, projetos, issues, documentos, updates) encaixa bem nesse uso.

## Como eu divido

| Onde | O que guarda | Quem lê |
|---|---|---|
| Descrição do projeto | objetivo, foco atual e decisões | o Claude, antes de começar qualquer trabalho no projeto |
| Issue | uma tarefa: plano, perguntas, decisões e fechamento, como comentários | eu, para revisar uma tarefa por vez; o Claude, para retomar |
| Documento do projeto | texto longo que eu edito (guia, rascunho, pesquisa) | os dois |
| Project update | o que uma sessão fez, decidiu e deixou pendente | eu, para acompanhar; o Claude, na próxima sessão |

## Por que isso permite fazer várias coisas ao mesmo tempo

Com o contexto no Linear, cada sessão do Claude começa sabendo onde a anterior parou. Dá para abrir uma sessão no projeto A, outra no B, e voltar a qualquer uma no dia seguinte. A sessão lê a descrição do projeto e a issue, e segue.

Também fica fácil delegar: uma issue bem escrita é um pedido completo, para um agente ou para outra pessoa.

## Ligar ao Claude Code

1. Conecte o MCP do Linear. O caminho mais simples é o conector do claude.ai; a outra opção está na [documentação do Linear](https://linear.app/docs/mcp).
2. Copie a skill [`linear`](../skills/linear/SKILL.md) para `~/.claude/skills/linear/` e adapte a tabela de times.
3. No seu `CLAUDE.md`, a linha "O que fazer, o foco e as decisões de cada projeto estão no Linear (skill `linear`)" já faz o Claude buscar o contexto lá.

## Regras que evitaram bagunça

- Nunca issue sem projeto.
- Uma tarefa, uma issue. Discussão da tarefa fica nos comentários dela, não espalhada em chat.
- Antes de criar, procurar se já existe.
- Decisão nova volta para a descrição do projeto; senão, a próxima sessão trabalha com a decisão velha.
