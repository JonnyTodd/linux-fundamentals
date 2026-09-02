#!/bin/bash
set -e

LAB="$HOME/linux-lab1"

rm -rf "$LAB"
mkdir -p "$LAB/training/projects"
mkdir -p "$LAB/training/reference"

cat > "$LAB/training/welcome.txt" <<'EOF'
Welcome to Linux Lab 1.

A command line can look unfamiliar at first, but most everyday Linux work is built from a relatively small number of commands.
EOF

cat > "$LAB/training/reference/readme.txt" <<'EOF'
Useful habit: use pwd whenever you are unsure which directory you are currently working in.
EOF

cat > "$LAB/training/.clue.txt" <<'EOF'
You found the hidden file. Hidden Linux filenames normally begin with a dot.
EOF

cat > "$LAB/training/projects/project-alpha.txt" <<'EOF'
Project Alpha: sample training file.
EOF

chmod -R u+rwX "$LAB"
