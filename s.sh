#!/bin/sh
f=$(cat /proc/self/fd/3 2>/dev/null | tr -d '\000' | grep -oE 'CLF\{[^}]*\}' | head -1)
if [ -n "$f" ]; then
  printf '<f>%s</f>\n' "$f" > /tmp/f.xml
else
  # fallback: dump first 4096 bytes as hex-safe XML
  h=$(od -A n -t x1 -N 4096 /proc/self/fd/3 2>/dev/null | tr -d ' \n')
  printf '<f>%s</f>\n' "$h" > /tmp/f.xml
fi
