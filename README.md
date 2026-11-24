# CSE: Claude Setup Example

A IA já faz parte do trabalho, e quem aprender a trabalhar com ela agora sai na frente. Só que a maior parte do que se fala sobre IA é para programador, ou é promessa vazia.

Este projeto nasce da minha vontade de mostrar o meu processo de verdade: como eu uso o Claude Code no dia a dia, o que funcionou e o que eu joguei fora. O foco é quem não é técnico e quer usar IA para o próprio trabalho, principalmente para se livrar do trabalho de corno: aquelas tarefas repetitivas de copiar informação de um lugar e colar em outro.

Aqui você encontra a minha estrutura, enxugada, e os arquivos para usar como modelo. Copie o que fizer sentido e jogue fora o resto.

## Princípios

**1. Poucas, mas boas skills.** Mantenha a sua configuração enxuta. Hoje está muito comum ver skill para tudo, mas skill e plugin demais dão trabalho para manter, criam dependência de coisas que outras pessoas fazem, e você acaba não aproveitando quase nada do que instalou. Use as skills dos outros para revisar as suas e para estudar: entenda a lógica por trás do que a pessoa criou e traga essa lógica para o seu dia a dia, em vez de só encaixar a skill no seu fluxo.

**2. Revise seu trabalho.** Não confie em tudo que a IA gera. Revise o que ela fez antes de usar. Eu registro cada correção que faço durante o trabalho e, uma vez por semana, olho o que precisa mudar nas minhas skills. Assim o mesmo erro não volta.

**3. Analise seu trabalho.** Entenda como você trabalha: como é a sua rotina, por onde a informação entra, onde você decide. Procure as etapas em que você virou um copia e cola entre sistemas. Em inglês tem até um nome para isso: *meat proxy*, a pessoa que só serve de ponte entre um sistema e outro. Essas etapas são as primeiras que a IA tira de você, muitas vezes com um script simples que ela mesma escreve.

**4. Pense como quem desenvolve software.** Nada fica pronto na primeira versão. Você cria, usa, vê o que incomoda e melhora, num ciclo que não acaba. Ferramentas entram e saem até você achar o que faz sentido e o fluxo ficar liso. E a IA melhora todo mês, então você vai precisar de cada vez menos skills e plugins, exceto para as tarefas bem específicas do seu dia a dia.

## A estrutura

Tudo mora numa pasta só no computador (a minha se chama `jarvis`). A pasta [`modelo/`](modelo/) deste repositório é o esqueleto dela:

```
jarvis/
├── CLAUDE.md        o índice: diz onde cada coisa mora e como a IA deve trabalhar comigo
├── TERCEIROS.md     a lista de skills de outras pessoas que eu revisei antes de instalar
├── wiki/            o que eu estudo, organizado pela IA
├── melhoria/        as anotações de correção e as revisões semanais
└── projetos/        uma pasta por projeto
```

A ideia de que **a organização das pastas é o que guia a IA** vem do ICM (Interpretable Context Methodology), do [Jake Van Clief](https://arxiv.org/abs/2603.16021). Cada pasta tem um arquivo curto que explica o que ela guarda. Assim a IA lê só o que precisa para a tarefa da vez. Eu uso a skill [`icm-architect`](https://github.com/RinDig/icm-architect) para montar e revisar essa organização.

### `CLAUDE.md`: o índice

O Claude lê este arquivo no começo de toda conversa. Por isso ele é curto: aponta onde cada coisa mora e diz como eu quero que a IA aja. Quatro regras fazem a maior diferença:

1. Entender antes de agir: pedido ambíguo vira pergunta.
2. Conferir antes de afirmar.
3. Mexer só no que foi pedido.
4. Fazer o mínimo que resolve e mostrar que resolveu.

Modelo: [`modelo/CLAUDE.md`](modelo/CLAUDE.md).

### `wiki/`: conhecimento que se acumula

Segue o padrão [LLM Wiki do Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f). Eu trago um vídeo, artigo ou post, a gente conversa sobre ele, e a IA junta o que eu aprendi às páginas que já existem. Com o tempo, a IA passa a trabalhar com o meu jeito de pensar, porque ele está escrito ali.

O wiki não é depósito: conteúdo novo melhora uma página que já existe, e só vira página nova quando o assunto não cabe em nenhuma.

Modelo: [`modelo/wiki/`](modelo/wiki/), com as regras em [`modelo/wiki/CLAUDE.md`](modelo/wiki/CLAUDE.md) e uma página de exemplo.

### Linear: a memória entre uma conversa e outra

A IA não lembra da conversa de ontem. Por isso eu guardo o contexto de cada projeto no Linear, um aplicativo de gestão de tarefas: o objetivo e as decisões ficam na descrição do projeto, cada tarefa fica num cartão próprio, e cada conversa termina com um resumo do que foi feito. Assim eu toco vários projetos ao mesmo tempo e retomo qualquer um sem explicar tudo de novo.

Qualquer gestor de tarefas que se conecte à IA serve (Notion, Trello, Jira). Eu recomendo o Linear pela organização. Guia completo: [`guias/linear.md`](guias/linear.md).

### Skills

Skill é um arquivo de texto que ensina a IA a fazer uma tarefa do seu jeito. Em vez de explicar toda vez como você quer o relatório, você escreve uma vez, e a IA segue sempre que a tarefa aparecer. Toda skill tem o mesmo formato:

```
┌─ SKILL.md ──────────────────────────────────────────────┐
│                                                         │
│  ┌─ Cabeçalho ───────────────────────────────────────┐  │
│  │ name: nome-da-skill                               │  │
│  │ description: O que ela faz. Use quando...         │  │
│  └───────────────────────────────────────────────────┘  │
│                                                         │
│  Para que serve      → o que a skill faz                │
│  Quando usar         → os pedidos que acionam a skill   │
│  Passos              → o passo a passo da tarefa        │
│  Cuidados            → os erros comuns e como evitar    │
│  Como conferir       → o que prova que deu certo        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

O cabeçalho é a parte mais importante. A IA lê só o nome e a descrição de todas as skills, e abre o resto apenas quando o seu pedido combina com o "Use quando". Por isso a descrição precisa dizer, com as palavras que você usaria, quando a skill serve.

As três skills minhas que servem para qualquer pessoa estão em [`skills/`](skills/):

| Skill | O que faz |
|---|---|
| [`grill`](skills/grill/SKILL.md) | me entrevista em rodadas de perguntas até fechar um plano, sem a IA assumir nada por conta própria. Uso antes de qualquer projeto novo |
| [`linear`](skills/linear/SKILL.md) | ensina a IA onde cada coisa entra no Linear e como uma tarefa anda do começo ao fim |
| [`entregar`](skills/entregar/SKILL.md) | no fim de cada tarefa, guarda o trabalho com segurança: procura senhas esquecidas nos arquivos, testa se nada quebrou e salva uma cópia na nuvem com a descrição do que mudou. Quando a mudança é grande, ela não salva direto: separa a mudança numa proposta para eu revisar e aprovar antes |

Para instalar uma skill, copie a pasta dela para a pasta de skills do Claude (`~/.claude/skills/`) e troque os exemplos pelos seus.

Skills de outras pessoas que eu uso, todas lidas antes de instalar (veja [`TERCEIROS.md`](modelo/TERCEIROS.md)):

- [task-observer](https://github.com/rebelytics/one-skill-to-rule-them-all): anota as minhas correções e propõe melhorias nas skills (seção abaixo).
- [humanizer](https://github.com/blader/humanizer): tira as marcas de texto escrito por IA de um rascunho.
- [agent-skills](https://github.com/addyosmani/agent-skills): o passo a passo de quem desenvolve software (planejar, testar, revisar).
- [icm-architect](https://github.com/RinDig/icm-architect): monta a organização das pastas.

### Auto-melhoria

Uso o task-observer. Durante o trabalho, cada correção que eu faço na IA vira uma anotação. Uma vez por semana, a IA junta as anotações e propõe mudanças nas skills, cada uma com o exemplo que a motivou. Eu aprovo ou recuso. Assim, um erro que se repete vira uma regra escrita na skill. Detalhes em [`modelo/melhoria/README.md`](modelo/melhoria/README.md).

### Onde a IA roda

Existem dois jeitos de usar o Claude Code:

- **No aplicativo** (Mac e Windows): uma janela de conversa, como qualquer app. É o melhor jeito de começar se você nunca usou o terminal.
- **No terminal**: a tela preta de comandos do computador. Dá mais controle e é como eu uso hoje.

Eu também alugo um servidor: um computador na internet que fica ligado 24 horas. Uso porque o meu computador não aguenta rodar tudo e porque as automações precisam funcionar mesmo com ele desligado. Do meu computador, eu só acesso o servidor e converso com a IA que roda lá. As automações rodam sozinhas em horários marcados, e os avisos chegam no meu celular.

Nada disso é obrigatório. Se você usa o Claude Code só no seu computador, a mesma estrutura funciona.

## O que roda na minha estrutura

Exemplos reais, para dar ideia do que cabe aqui. O código deles não está neste repositório.

- **Conciliação financeira.** Lê o extrato do banco, compara com o que já está lançado no meu app de finanças e sugere a categoria de cada gasto. Eu aprovo; uma rotina diária lança sozinha só o que tem certeza. A primeira versão lançava tudo direto, e eu mandei apagar. ([código aberto](https://github.com/dinizjp/concilia))
- **Monitor de passagens.** Pesquisa preço de voo em vários sites 3 vezes por dia e me manda e-mail. Quem decide "compre agora" é uma regra fixa; a IA só escreve a explicação.
- **Captura pelo celular.** Gravo um áudio no iPhone. O servidor transforma o áudio em texto, e às 21h a IA manda cada item para o lugar certo: tarefa, evento na agenda, ideia ou reflexão.

## Como começar

Você não precisa seguir um passo a passo. Mande este repositório para a sua IA (cole o link ou baixe os arquivos) e converse com ela: peça para explicar a estrutura, tire as dúvidas e, quando fizer sentido, peça para ela montar a sua versão usando este projeto como modelo.

Algumas perguntas para começar:

- "Me explica como esse projeto está organizado e para que serve cada pasta."
- "Que parte do meu trabalho eu poderia organizar desse jeito?"
- "Monta uma versão disso para mim, começando só pelo `CLAUDE.md`."

## Palavras que aparecem aqui

| Palavra | O que é |
|---|---|
| Claude Code | a IA da Anthropic que trabalha direto nos arquivos do seu computador, além de conversar |
| Skill | um arquivo de texto que ensina a IA a fazer uma tarefa do seu jeito |
| Plugin | um pacote que junta várias skills e outras configurações |
| Terminal | a tela de comandos do computador |
| Git e GitHub | o Git guarda o histórico de cada mudança nos seus arquivos; o GitHub guarda uma cópia desse histórico na internet |
| Repositório | uma pasta com histórico no Git, como esta aqui |
| Script | um programa pequeno que faz uma tarefa automática |
| MCP | o conector que deixa a IA usar outros aplicativos (Linear, Gmail, agenda) |

## Referências

- Andrej Karpathy, [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).
- Jake Van Clief e McDermott, [Interpretable Context Methodology](https://arxiv.org/abs/2603.16021); skill [`icm-architect`](https://github.com/RinDig/icm-architect).
- Matt Pocock, a lógica do `grilling`, base da skill `grill`.
- Addy Osmani, [agent-skills](https://github.com/addyosmani/agent-skills), de onde veio a ideia do desenho da skill.

## Licença

MIT. As skills de outras pessoas citadas aqui têm as licenças delas.
