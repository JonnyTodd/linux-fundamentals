#!/bin/bash
DEST="$HOME/linux-lab1/submission/week1"
SRC="$HOME/linux-lab1/training/practice"

test -d "$DEST" &&
test -f "$DEST/linux-notes.txt" &&
test -f "$DEST/welcome-copy.txt" &&
test -f "$DEST/clue.txt" &&
test ! -e "$SRC/commands.txt"
