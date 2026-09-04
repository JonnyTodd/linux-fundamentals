# Incident 1 — recover the confidential file

Operations reports that a file called `quarterly-plan.txt` has been left somewhere below the company directory.

It contains confidential material and belongs in:

```text
secure/quarterly-plan.txt
```

## Your task

1. Locate the file.
2. Read enough of it to confirm it is the correct document.
3. Move it into the approved `secure` directory.
4. Prove the old copy no longer remains.

The new command introduced today is:

```text
find STARTING-POINT -name "FILENAME"
```

Select **CHECK** when the file is in the approved location.
