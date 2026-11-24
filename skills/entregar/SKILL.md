---
name: entregar
description: Checa, faz commit e push dos repositórios de ~/jarvis (a raiz e cada projeto em ~/jarvis/projetos), e aponta o que depende da mudança. Use ao terminar qualquer tarefa que mudou arquivo em ~/jarvis, em skill ou configuração do Claude, sem o usuário pedir; e quando ele disser "commit", "push", "entrega", "manda pro GitHub", "o que falta subir".
---

# Entregar

Leva o trabalho de um repositório até o GitHub com prova de que nada quebrou. Regra: **push sem perguntar quando a checagem passa**. Checagem que falha é *vermelho*: nada de commit, nada de push, e o usuário vê o erro.

## Passos

**1. Varrer.** Rode `~/.claude/skills/entregar/varrer.sh`. Ele lista cada repositório com mudança sem commit ou commit sem push, e marca `SEGREDO?` e `ARQUIVO SENSÍVEL`.
Pronto quando: você tem a lista de repositórios pendentes, ou a frase "Nada pendente".

**2. Segredos.** Para cada marca do passo 1, abra o arquivo na linha indicada. Chave ou senha de verdade: *vermelho* para aquele repositório. Diga o arquivo e a linha, sem repetir o valor. Falso positivo: siga.
Pronto quando: toda marca tem veredito.

**3. Checar.** Para cada repositório pendente, rode a checagem dele (tabela abaixo): provar que funciona, sem aumentar o escopo.
Pronto quando: cada repositório está *verde* (toda checagem passou, com a saída vista) ou *vermelho* (com o erro em mãos).

**4. Commit.** Só nos *verdes*. Um commit por assunto. Mensagem no estilo do `git log` do repositório. Adicione arquivos pelo nome; arquivo que você não reconhece entra só depois de olhar o conteúdo.
Pronto quando: `git status` está limpo, ou o que sobrou está explicado.

**5. Push.** `git push` na branch atual. Push recusado por histórico divergente é *vermelho*: mostre ao usuário, sem `--force` e sem rebase por conta própria.
Pronto quando: `varrer.sh` mostra "sem push: 0" para todo *verde*.

**6. Relatar.** Uma linha por repositório: commit e push feitos, ou *vermelho* com o erro. Sem repetir o diff.

## Mudança grande: PR

**Pequeno** (texto, ajuste de poucas linhas, correção óbvia): fluxo acima, push direto no `main`.
**Grande**: comportamento novo, mudança em automação que roda sozinha (cron), segurança, dinheiro, ou mais de ~3 arquivos de código. Na dúvida, perguntar no começo.

Decidir **antes de editar**: se um cron roda o código direto da pasta do repositório, mudança grande nunca é feita nela.

1. **Ramo numa cópia separada.** Nome do ramo = o `gitBranchName` da issue.
   `git -C <repo> fetch -q && git -C <repo> worktree add ~/worktrees/<repo>/<ramo> -b <ramo> origin/main`
2. **Trabalhar e checar na cópia**, commits por assunto.
3. **Abrir o PR:** `git push -u origin <ramo>` e `gh pr create`. Corpo para quem vai revisar: o que muda e por quê, o que olhar, como foi testado, riscos e como desfazer, link da issue.
4. **Merge só com o "pode" do usuário**, depois de ler toda a revisão (comentários gerais e de linha). Depois: `gh pr merge <n> --squash --delete-branch`, `git pull --ff-only` na pasta original e `git worktree remove` da cópia.

## Checagem por repositório

Uma linha por repositório seu. Exemplos:

| Repositório | Checagem |
|---|---|
| projeto Python | `python3 -m unittest`; `python3 -m py_compile` em cada `.py` que mudou |
| scripts de servidor | `bash -n` em cada `.sh` que mudou; `nginx -t` se mudou a configuração do nginx |
| qualquer um | JSON e YAML que mudaram têm de abrir sem erro; caminho citado em `CLAUDE.md` ou skill tem de existir |

Mudança só em texto tem checagem vazia: é *verde* direto.
