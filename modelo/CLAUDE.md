# Índice central

Este arquivo só aponta; o detalhe fica na pasta de cada coisa. Tudo mora em `~/jarvis` (troque pelo nome da sua pasta).

Para o Claude Code ler este arquivo em qualquer pasta, importe-o no seu `~/.claude/CLAUDE.md` com a linha `@~/jarvis/CLAUDE.md`.

Projeto novo nasce em `projetos/<nome>`, com repositório próprio e projeto próprio no gestor de tarefas. Skill de um projeto fica dentro dele, com link simbólico em `~/.claude/skills/`.

## Como trabalhar comigo
- O que fazer, o foco e as decisões de cada projeto estão no Linear (skill `linear`).
- Perguntar antes de mudar padrão global: modelo, plugin, configuração.
- Quando eu pedir para ajustar algo, ajustar. Não remover nem desligar.
- Ao terminar uma tarefa que mudou arquivo: rodar a skill `entregar` sem eu pedir.
- Mudança grande (comportamento novo, automação que roda sozinha, segurança, dinheiro, mais de ~3 arquivos de código) vai por PR. Merge só com o meu "pode".
- Começar simples.
- Skill ou plugin de terceiro: só depois da checagem em `TERCEIROS.md`, e eu decido.

## Como agir
1. **Entender antes de agir.** Pedido ambíguo: perguntar o objetivo antes de mexer.
2. **Checar antes de afirmar.** Não dizer que algo não existe ou está pendente sem conferir na hora. Sem como conferir: dizer que não conferiu.
3. **Mexer só no que foi pedido.** Cada linha alterada vem do pedido. Achou outra coisa errada: avisar, não corrigir junto.
4. **O mínimo que resolve, e provar que resolveu.** Toda tarefa tem um critério verificável (teste passa, comando roda, mensagem chega) e só termina quando ele foi visto.

## Estilo de escrita
Mostre só o que eu preciso para decidir ou agir.
- Comece pela resposta. Diga cada ideia uma vez.
- Frases curtas. Voz ativa. Um nome por conceito.
- Sem adjetivos de enfeite e sem ressalvas vagas.

## Mapa
Cada coisa tem um lugar só. Quando algo mudar de lugar, atualizar aqui.

| O quê | Onde |
|---|---|
| Wiki de conhecimento | `wiki/` (regras em `wiki/CLAUDE.md`) |
| Auto-melhoria | `melhoria/` |
| Skills e plugins de terceiros revisados | `TERCEIROS.md` |
| Projetos | `projetos/` (um `README.md` em cada) |

## Projetos: `projetos/`

| Projeto | O que é | Skill |
|---|---|---|
| `exemplo/` | uma linha dizendo o que o projeto faz | `nome-da-skill` |
