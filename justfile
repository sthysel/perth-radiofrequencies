# List available recipes
[doc("List available recipes")]
help:
    @just --list

# Convert frequencies.txt to CSV format
[doc("Convert frequencies.txt to CSV format")]
csv:
    @python tocsv.py > frequencies.csv

# Convert CSV to markdown table
[doc("Convert CSV to markdown table")]
markdown:
    @python -c "import csv; rows=list(csv.reader(open('frequencies.csv'))); print('# Perth, Western Australia, radio frequencies\n'); print('| ' + ' | '.join(rows[0]) + ' |'); print('|' + '|'.join(['---']*len(rows[0])) + '|'); [print('| ' + ' | '.join(r) + ' |') for r in rows[1:]]" > readme.md
