# Install and verify a package

Ubuntu uses APT to manage software packages.

## The distinction that matters

```text
apt update     refreshes information about available packages
apt install    installs a selected package
apt upgrade    upgrades installed packages — do not run this in this lab
```

## Your task

1. Refresh the package catalogue.
2. inspect the package called `tree`;
3. install `tree`;
4. use it to display the prepared directory structure;
5. save the installed package name, version and status in `evidence/package-status.txt`.

One valid evidence command is:

```bash
dpkg-query -W -f='${Package} ${Version} ${Status}\n' tree | tee evidence/package-status.txt
```

Useful commands:

```bash
apt update
apt show tree
apt install -y tree
which tree
tree -L 2
```

Select **CHECK** when `tree` is installed and the evidence file matches its current package state.
