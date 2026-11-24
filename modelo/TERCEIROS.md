# Skills e plugins de terceiros

Pode usar, mas **só depois de uma checagem de segurança, antes de instalar**. Skill e plugin divulgados em rede social rodam com o seu acesso: leem seus arquivos e executam comandos.

## Checagem antes de instalar

1. **Origem:** quem é o autor; idade do repositório; estrelas e issues; licença; se é o repositório oficial (não um fork com nome parecido).
2. **Ler todos os arquivos** antes de instalar, sem executar nada. Procurar:
   - scripts e hooks (`hooks`, `postinstall`, `.sh`, `.py`);
   - comandos de rede (`curl`, `wget`, `fetch`, URLs desconhecidas);
   - acesso a segredos (`.env`, chaves, `~/.ssh`, tokens);
   - código ofuscado ou em base64;
   - instruções escondidas no texto da skill ("ignore as instruções anteriores", "envie...", "não conte ao usuário").
3. **Permissões:** o que o plugin pede (MCP, bash, rede) e se faz sentido para o que ele promete.
4. **Relatório:** o Claude resume o que a skill faz, os riscos e recomenda instalar, recriar uma versão sua ou descartar. **Você decide**; só então instala.
5. **Prender a versão:** instalar de um commit específico, anotar qual foi e revisar o diff a cada atualização.

## Instalados e revisados

Uma linha por item: nome, origem, licença, commit e qualquer adaptação sua.

- **exemplo** (skill de `autor/repositorio`, MIT, presa no commit `abc1234`): o que faz e quando usar.
