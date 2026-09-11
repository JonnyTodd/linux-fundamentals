# Build the incident timeline

Correlation means comparing evidence from several sources to discover whether the events form one connected sequence.

Review the three prepared timeline extracts:

```bash
cd ~/cyber-lab2/northstar-incident
cat timeline/email.log
cat timeline/auth.log
cat timeline/host.log
```

Combine them and put the records into time order:

```bash
cat timeline/*.log | sort | tee evidence/combined-timeline.txt
```

### Read the pipeline from left to right

- `cat timeline/*.log` displays every file ending in `.log` inside `timeline`.
- `*` is a **wildcard**. It stands for any sequence of characters.
- the pipe passes all displayed lines to `sort`.
- `sort` arranges the ISO-formatted timestamps into order.
- the second pipe passes the ordered lines to `tee`.
- `tee` displays and saves the completed timeline.

In plain English: **combine the three timeline files, arrange every event by time, show the result and save a copy**.

Select **CHECK** when the saved timeline contains all seven events in the correct order.
