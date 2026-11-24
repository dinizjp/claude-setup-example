#!/bin/bash
# Mostra, para o repositório ~/jarvis e cada repositório de ~/jarvis/projetos (troque a pasta em RAIZ), o que falta commit e push,
# e aponta onde pode haver segredo no que vai entrar. Só lê: não muda nada.
# Uso: varrer.sh            (todos os repos)
#      varrer.sh concilia   (só um; "jarvis" = a raiz)
set -uo pipefail
RAIZ="${RAIZ:-$HOME/jarvis}"

# Nome de chave seguido de valor longo, ou formato conhecido de chave.
PADRAO='(api[_-]?key|token|secret|senha|password|passwd|webhook)[a-z_]*["'"'"']?[[:space:]]*[:=][[:space:]]*["'"'"']?[A-Za-z0-9_/+.-]{16,}|sk-[A-Za-z0-9_-]{20,}|ghp_[A-Za-z0-9]{30,}|xox[baprs]-[A-Za-z0-9-]{10,}|hooks\.slack\.com/services/|-----BEGIN [A-Z ]*PRIVATE KEY-----|AKIA[0-9A-Z]{16}'
SENSIVEL='(^|/)\.env|\.pem$|\.key$|\.p12$|\.pfx$|(^|/)id_(rsa|ed25519|ecdsa)'

limpo=1
case "${1:-}" in
  "") dirs=("$RAIZ/" "$RAIZ"/projetos/*/) ;;
  jarvis) dirs=("$RAIZ/") ;;
  *) dirs=("$RAIZ/projetos/$1/") ;;
esac
for d in "${dirs[@]}"; do
  [ -d "$d/.git" ] || continue
  cd "$d" || continue
  sujo=$(git status --porcelain | wc -l | tr -d ' ')
  frente=$(git rev-list --count '@{u}..HEAD' 2>/dev/null || echo "sem upstream")
  [ "$sujo" = 0 ] && [ "$frente" = 0 ] && continue
  limpo=0
  echo "== $(basename "$d") | branch $(git branch --show-current) | sem commit: $sujo | sem push: $frente"
  git status --short
  # Arquivos que mudaram ou são novos. Mostra só arquivo e linha, nunca o valor.
  { git diff HEAD --name-only; git ls-files --others --exclude-standard; } 2>/dev/null | sort -u | while IFS= read -r f; do
    [ -f "$f" ] || continue
    if printf '%s\n' "$f" | grep -qEi "$SENSIVEL"; then echo "  ARQUIVO SENSÍVEL: $f"; continue; fi
    file -b --mime "$f" | grep -q '^text' || continue
    linhas=$(grep -nEi "$PADRAO" "$f" 2>/dev/null | cut -d: -f1 | tr '\n' ',' | sed 's/,$//')
    [ -n "$linhas" ] && echo "  SEGREDO? $f (linhas $linhas)"
  done
done
[ "$limpo" = 1 ] && echo "Nada pendente: todos os repositórios estão com commit e push em dia."
exit 0
