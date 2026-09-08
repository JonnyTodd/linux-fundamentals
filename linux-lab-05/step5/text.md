# Analyse the access log

The supplied `logs/web-access.log` records requests to the service.

Inspect the beginning and end of the file, then identify the unsuccessful requests. In this simplified log, HTTP status code `404` means the requested resource was not found.

## Produce two reports

### `reports/not-found.txt`

- every complete line containing status code `404`;
- the total number of those lines as the final line.

### `reports/repeated-source.txt`

- every complete line for the source IP that generated the most `404` responses;
- the number of its requests as the final line.

Useful commands:

```bash
head
tail
grep " 404 "
grep -c " 404 "
>
>>
```

Select **CHECK** when both reports contain complete source records in their original order and the correct final counts.
