# Step 2 — Navigate the filesystem

A Linux filesystem is arranged as a single tree beginning at `/`.

For this lab, your training files are stored inside:

```text
~/linux-lab1/training
```

The `~` symbol means **your home directory**.

Move there:

```bash
cd ~/linux-lab1/training
```

Check that you arrived:

```bash
pwd
```

Now list the contents:

```bash
ls
```

You should see several items, including a `projects` directory and `welcome.txt`.

Move into `projects`:

```bash
cd projects
```

Check your location again:

```bash
pwd
```

Move back up one level:

```bash
cd ..
```

`..` means **the parent directory**.

## Your task

While inside the `training` directory, create a new directory called:

```text
practice
```

You will need the `mkdir` command.

When you think you have completed the task, select **CHECK**.
