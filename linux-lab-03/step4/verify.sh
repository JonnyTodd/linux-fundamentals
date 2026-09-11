#!/bin/bash
if pgrep -x report-worker >/dev/null 2>&1; then
  exit 1
fi

exit 0
