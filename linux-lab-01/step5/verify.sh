#!/bin/bash
test -f "$HOME/linux-lab1/training/.clue.txt" &&
test -f "$HOME/linux-lab1/training/practice/clue.txt" &&
cmp -s "$HOME/linux-lab1/training/.clue.txt" "$HOME/linux-lab1/training/practice/clue.txt"
