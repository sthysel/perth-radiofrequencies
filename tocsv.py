#! /usr/bin/env python3


def getline(line, user):
    cols = line.split(maxsplit=1)
    try:
        frequency = float(cols[0])
        if len(cols) == 2:
            description = cols[1].translate(str.maketrans({",": " "}))
        else:
            description = ""
        return user, frequency, description
    except ValueError:
        user = line
        return user, None, None

if __name__ == "__main__":
    user = None
    src = open('frequencies.txt', 'r').readlines()
    for line in src:
        line = line.strip()
        if line == "":
            continue
        user, frequency, description = getline(line, user)

        if user and frequency and description:
            print("{},{},{}".format(user, frequency, description))
