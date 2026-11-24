---
name: linear
description: Regras de como usar o Linear: onde cada issue, ideia, documento e projeto entra, o fluxo de uma tarefa pela issue e o update de sessão. Use antes de criar, mover ou comentar issue, projeto ou documento no Linear, ao começar trabalho num projeto, e quando o usuário disser "joga no Linear", "cria uma issue", "anota essa ideia", "to-do".
---

# Linear

O Linear é a interface para tudo o que é trabalho: tarefa, bug, feature nova, pesquisa, ideia e documento. Acesso pelo MCP do Linear. É também a memória entre sessões: o Claude começa cada conversa sem lembrar da anterior, e o contexto que importa fica aqui.

## Contexto vem do projeto

A descrição de cada projeto é o contexto dele: objetivo, foco atual e decisões. Antes de trabalhar num projeto, ler a descrição (`get_project`) e as issues em andamento. O que mudou de foco ou de decisão volta para a descrição do projeto.

## Times

Adapte à sua vida. Exemplo:

| Time | Sigla | O que entra |
|---|---|---|
| Vida | VID | dia a dia e coisas pessoais (projeto Coisas a Fazer) |
| Projetos | PRJ | um projeto por pasta de `~/jarvis/projetos`, mais Ideias e Wiki |
| Robôs | BOT | issues criadas e lidas por automações, nunca outra coisa |

No código e nos filtros, usar a sigla (não muda se o nome mudar).

## Onde cada coisa entra

- **To-do:** issue em Todo. Avulso do dia a dia vai no projeto Coisas a Fazer. Nunca deixar issue sem projeto.
- **Ideia nova (pode virar projeto):** card no projeto Ideias. Backlog = anotada, Todo = explorar, In Progress = explorando, Done = virou projeto (criar o projeto e linkar), Canceled = descartada.
- **Melhoria de projeto que já existe:** card no projeto dele, em Backlog, com a etiqueta `Ideia`.
- **Documento:** documento do Linear dentro do projeto a que pertence.
- **Projeto novo:** pasta nova em `~/jarvis/projetos` = projeto novo no Linear.

Antes de criar, conferir com `list_issues` se já existe.

## Uma tarefa, uma issue

Tarefa, bug, feature ou pesquisa: contexto, plano, decisões, dúvidas e mudanças ficam na issue dela, como comentários. Assim dá para revisar uma tarefa por vez, com calma, e retomar em outra sessão sem explicar tudo de novo.

- Ramo e PR com o `gitBranchName` da issue, para o Linear ligar o PR. Merge do PR fecha a issue sozinho.
- Texto curto: plano em até 5 linhas; perguntas numeradas com recomendação; fechamento em até 3 linhas (o que mudou, como conferir, link do PR ou commit). Detalhe técnico vai no PR.

## Update de sessão

Ao fim de uma sessão que avançou um projeto, postar um *project update* (`save_status_update`): o que foi feito, decidido e pendente, com link para as issues e documentos.
