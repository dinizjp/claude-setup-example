# Auto-melhoria

Pasta de trabalho do [task-observer](https://github.com/rebelytics/one-skill-to-rule-them-all), skill de terceiro (CC BY 4.0) que observa as sessões e propõe melhorias nas skills.

O ciclo:

1. **Observar.** Durante o trabalho, cada correção minha, retrabalho ou regra que o Claude quebrou vira uma observação em `skill-observations/observation-log/`.
2. **Revisar.** Uma vez por semana, o Claude junta as observações e propõe mudanças nas skills, cada uma com a evidência.
3. **Aprovar.** Eu aprovo ou recuso. A mudança aprovada vai para a skill; a recusada fica registrada com o motivo.

A instalação e o bloco que vai no `CLAUDE.md` estão no repositório do autor (`references/environments.md`). Ele também traz um hook de início de sessão. Esta pasta começa vazia; a skill cria o que precisa na primeira sessão.
