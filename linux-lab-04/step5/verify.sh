#!/bin/bash
set -e

if pgrep -x backup-loop >/dev/null; then
  echo 'backup-loop is still running'
  exit 1
fi
