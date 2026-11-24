# CSE: Claude Setup Example

Como eu uso o Claude Code no dia a dia, com os arquivos para você adaptar à sua estrutura.

É a minha estrutura real, enxugada, para servir de exemplo. Copie o que fizer sentido para o seu trabalho e jogue fora o resto.

## Princípios

**1. Poucas e boas skills.** Hoje tenho 7 skills minhas. Cada uma nasceu de um pedido que eu repetia toda semana. Antes de criar uma skill nova, pergunte se você vai usá-la de novo; antes de instalar uma de terceiro, leia o código (veja [`TERCEIROS.md`](modelo/TERCEIROS.md)). Skill demais confunde o Claude sobre qual usar e enche o contexto.

**2. Revisar sempre.** O Claude erra do mesmo jeito até alguém mudar a regra. Eu registro as correções que faço durante o trabalho e reviso uma vez por semana o que precisa mudar nas skills. Assim a estrutura melhora com o uso.

**3. Entender o processo antes de automatizar.** Antes de pedir qualquer coisa para a IA, descreva como você faz a tarefa hoje: os passos, de onde vêm os dados, onde você decide. Os pontos repetitivos aparecem sozinhos, e são eles que valem automatizar. Decisão que mexe com dinheiro ou com outra pessoa fica com você, ou com uma regra fixa no código. A IA sugere e explica.

**4. Aprender um pouco de código.** Não precisa virar programador. Um script de 50 linhas que lê uma planilha, cruza com um extrato e manda um aviso já resolve muita coisa, em qualquer área: marketing, contabilidade, finanças pessoais, operação. O Claude escreve o script; você precisa entender o suficiente para saber o que ele faz e conferir o resultado.

## A estrutura

Tudo mora numa pasta só (a minha se chama `~/jarvis`). A pasta [`modelo/`](modelo/) deste repositório é o esqueleto dela:

```
~/jarvis/
├── CLAUDE.md        índice: só aponta para o resto, mais as regras de como o Claude trabalha comigo
├── TERCEIROS.md     skills e plugins de outras pessoas que eu revisei antes de instalar
├── wiki/            o que eu estudo, compilado pelo Claude
├── melhoria/        observações e revisões da auto-melhoria
└── projetos/        um repositório git por projeto, cada um com README e, se precisar, skill
```

A ideia de que **a estrutura de pastas é a arquitetura** vem do ICM (Interpretable Context Methodology), do [Jake Van Clief](https://arxiv.org/abs/2603.16021). Cada pasta tem um arquivo curto que diz o que ela guarda, e o Claude lê só o que precisa para a tarefa da vez. Eu uso a skill [`icm-architect`](https://github.com/RinDig/icm-architect) para desenhar e revisar essa estrutura.

### `CLAUDE.md`: o índice

O Claude lê este arquivo no começo de toda conversa. Por isso ele é curto: aponta onde cada coisa mora e diz como eu quero que o Claude aja. Quatro regras fazem a maior diferença:

1. Entender antes de agir: pedido ambíguo vira pergunta.
2. Checar antes de afirmar.
3. Mexer só no que foi pedido.
4. Fazer o mínimo que resolve e provar que resolveu.

Modelo: [`modelo/CLAUDE.md`](modelo/CLAUDE.md).

### `wiki/`: conhecimento que se acumula

Segue o padrão [LLM Wiki do Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f). Eu trago uma fonte (vídeo, artigo, thread), conversamos sobre ela, e o Claude integra o que aprendi nas páginas que já existem. Com o tempo, o Claude passa a trabalhar com o meu jeito de pensar, porque ele está escrito ali.

O wiki não é depósito: fonte nova melhora uma página existente; só vira página nova quando o assunto não cabe em nenhuma.

Modelo: [`modelo/wiki/`](modelo/wiki/), com as regras em [`modelo/wiki/CLAUDE.md`](modelo/wiki/CLAUDE.md) e uma página de exemplo.

### Linear: contexto entre sessões

O Claude não lembra da conversa anterior. Eu guardo o contexto de cada projeto no Linear: objetivo e decisões na descrição do projeto, cada tarefa numa issue, o que cada sessão fez num update. Assim dá para tocar vários projetos em paralelo e retomar qualquer um sem explicar tudo de novo.

Qualquer gestor de tarefas com MCP serve. Eu recomendo o Linear pela estrutura. Guia completo: [`guias/linear.md`](guias/linear.md).

### Skills

As três que servem para qualquer pessoa estão em [`skills/`](skills/):

| Skill | O que faz |
|---|---|
| [`grill`](skills/grill/SKILL.md) | me entrevista em rodadas até fechar um plano sem nada assumido em silêncio. Uso antes de qualquer coisa grande |
| [`linear`](skills/linear/SKILL.md) | regras de onde cada coisa entra no Linear e como uma tarefa anda pela issue |
| [`entregar`](skills/entregar/SKILL.md) | no fim de cada tarefa: procura segredos, roda a checagem, faz commit e push; mudança grande vai por PR |

Para instalar, copie a pasta da skill para `~/.claude/skills/` e troque os exemplos pelos seus.

Skills de terceiros que eu uso, todas revisadas antes (veja [`TERCEIROS.md`](modelo/TERCEIROS.md)):

- [task-observer](https://github.com/rebelytics/one-skill-to-rule-them-all): auto-melhoria (seção abaixo).
- [humanizer](https://github.com/blader/humanizer): tira as marcas de texto de IA de um rascunho.
- [agent-skills](https://github.com/addyosmani/agent-skills): o ciclo de engenharia (especificar, planejar, testar, revisar).
- [icm-architect](https://github.com/RinDig/icm-architect): desenhar a estrutura de pastas.

### Auto-melhoria

Uso o task-observer. Durante o trabalho, cada correção minha ou regra que o Claude quebrou vira uma observação. Uma vez por semana, o Claude junta as observações e propõe mudanças nas skills, cada uma com a evidência. Eu aprovo ou recuso.

Assim, um erro que se repete vira uma regra escrita na skill. Detalhes em [`modelo/melhoria/README.md`](modelo/melhoria/README.md).

### Servidor (opcional)

Eu rodo tudo num servidor pequeno ligado 24/7, porque meu computador não aguenta e as automações precisam rodar mesmo com ele desligado. Acesso pelo terminal (`ssh`), e o computador vira só a interface. O cron roda os scripts direto das pastas dos projetos, e os avisos chegam no celular e no Slack.

Não é obrigatório. Se você só usa o Claude Code no seu computador, a mesma estrutura funciona sem servidor.

## O que roda na minha estrutura

Exemplos reais, para dar ideia do que cabe aqui. O código deles não está neste repositório.

- **Conciliação financeira.** Lê o extrato do banco, compara com o que já está lançado no meu app de controle e sugere categoria. Eu aprovo; uma rotina diária lança sozinha só o que é de alta confiança. A primeira versão lançava tudo direto, e eu mandei apagar. ([código aberto](https://github.com/dinizjp/concilia))
- **Monitor de passagens.** Pesquisa preço de voo em várias fontes 3 vezes por dia e me manda e-mail. Quem decide "comprar" é uma regra fixa no código; a IA só escreve a explicação.
- **Captura pelo celular.** Gravo um áudio no iPhone; o servidor transcreve, e às 21h o Claude manda cada item para o lugar certo: tarefa, evento na agenda, ideia ou reflexão.

## Como começar

1. Copie a pasta `modelo/` para uma pasta sua (ex.: `~/jarvis`).
2. Edite o `CLAUDE.md`: o que você faz, como quer que o Claude trabalhe, onde cada coisa mora.
3. No seu `~/.claude/CLAUDE.md`, adicione a linha `@~/jarvis/CLAUDE.md`, para o Claude ler o índice em qualquer pasta.
4. Copie as skills que fizerem sentido para `~/.claude/skills/`.
5. Conecte o gestor de tarefas pelo MCP e crie um projeto para cada pasta de `projetos/`.
6. Comece por um projeto pequeno: uma tarefa chata que você faz toda semana.

## Referências

- Andrej Karpathy, [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).
- Jake Van Clief e McDermott, [Interpretable Context Methodology](https://arxiv.org/abs/2603.16021); skill [`icm-architect`](https://github.com/RinDig/icm-architect).
- Matt Pocock, a lógica do `grilling`, base da skill `grill`.

## Licença

MIT. As skills de terceiros citadas têm as licenças delas.
