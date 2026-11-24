---
name: grill
description: Entrevista o usuário em rodadas de perguntas até fechar um plano, decisão ou ideia sem nada assumido em silêncio. Use quando ele disser "grill", "me questiona", "testa esse plano", ou quando um pedido ficar ambíguo demais para agir.
---

# Grill

Lógica do `grilling` do Matt Pocock (MIT), adaptada.

Entreviste o usuário até os dois terem o mesmo entendimento. Pense numa **árvore de decisões**: cada decisão abre as decisões que dependem dela.

## Rodadas

- **Fronteira** = as decisões cujos pré-requisitos já estão resolvidos, isto é, as perguntas que dá para fazer agora sem chutar respostas que você ainda não ouviu.
- Pergunte a fronteira inteira numa rodada. Depois **espere** as respostas antes da próxima.
- Pergunta que depende de outra ainda aberta nesta rodada vai para uma rodada seguinte.
- A cada resposta, recalcule a fronteira e faça a próxima rodada.

## Formato

Perguntas numeradas, cada uma com a sua recomendação. Escreva a pergunta de modo que "sim" aceite a recomendação.

```
**1. <título curto>:** <pergunta, com as opções quando houver>
→ Recomendo: <resposta e o porquê em uma frase>

**2. ...**
```

O usuário pode responder só com o número e "sim", "não" ou a alternativa.

## Fatos são seus; decisões são do usuário

- Fato do ambiente (arquivo, configuração, gestor de tarefas, estado do servidor): você mesmo levanta. Nunca pergunte o que dá para conferir.
- Enquanto um fato não chega, só as perguntas que dependem dele esperam; faça as outras.
- Decisão é do usuário: ponha cada uma para ele e espere.

## Fim

A entrevista acaba quando a fronteira está vazia: todos os ramos visitados e nada assumido. Mostre as decisões numa lista curta e **não aja** até o usuário confirmar que o entendimento é esse. As decisões vão para a issue da tarefa, como comentário.
