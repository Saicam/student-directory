# Student Directory #

The student directory allows you to manage the list of all students enrolled at the Academy



- [How to use](#how-to-use)
- [Important updates](#important-updates)
- [Excersises](#excersises)

## How to use

The program can be called from command line with or without a file in csv format. If a file is provided this will be load as the students list, if not the list will be empty

```shell
ruby directory.rb [file.csv]
```

A menu will be prompted with these options

```shell
1. Input the students.
2. Show the students.
3. Save the students list to file.
4. Load list of students from file.
9. Exit.
```

## Important updates

Added method to the code in this [commit.](d9b4cae6b367188758d2d3366b5e59a92112793a)


## Excercises

- [x] Typos in plain [text.](./example.rb)
- [x] Adding cohort by input.
- [ ] Print students organised by cohort.
- [x] Research and use `center()`.
- [ ] Use singular or plural when needed.
- [ ] Adding students in two places. **DRY** it
- [x] Use CSV Library.
- [ ] Program which reads its own code.
