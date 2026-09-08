# Inspect the administration server

The setup script may need a short moment to prepare the firewall tools. Wait until it reports ready:

```bash
until [ -f ~/linux-lab5/.setup-complete ]; do sleep 1; done; echo "Environment ready"
```

Move into the prepared environment:

```bash
cd ~/linux-lab5/northstar-admin
```

Before changing anything:

1. confirm your location;
2. read `README.txt`;
3. inspect the directories;
4. identify the Ubuntu release, available memory and filesystem capacity.

Useful commands:

```bash
pwd
cat README.txt
ls -la
lsb_release -d
uname -r
free -h
df -h /
```

There is no CHECK on this stage. Record your baseline findings on the student worksheet.
