#!/bin/bash
test -f "$HOME/linux-lab1/training/practice/linux-notes.txt" &&
test -f "$HOME/linux-lab1/training/practice/welcome-copy.txt" &&
test ! -e "$HOME/linux-lab1/training/practice/notes.txt"
