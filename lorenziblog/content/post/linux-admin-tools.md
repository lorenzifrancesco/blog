---
title: "Linux Admin Tools"
date: 2024-02-12
draft: false
---
This post is designed to be updated as soon as new tricks come handy.

## Useful commands

| Instruction     |                      Command     |
|-----------------|----------------------------------|
| Change user     | ```su - <username>```            |
| Change owner    | ```chown user:group -R folder``` |



## Linux ownership system
### rwx
Owner and permissions: typing ```la``` we get informations about the pemissions about a file or a folder
#### example

```
-rw-r--r--   1 lorenzi lorenzi 4,3K 19 gen 11.22 .bashrc
drwxr-xr-x  26 lorenzi lorenzi 4,0K  8 feb 14.01 bench/
```

the first column is divided in three parts:

| Owner of the file (U) | User group of the owner (G) | all others (O) |
|-----------------------|-----------------------------|----------------|
|``` rw-```            | ```r--```                   | ```r--```      |

the first character indicates the file type, that for example in the ```bench``` case is a directory.

### Octal characters
A mapping can be done from the three permissions to a single octal value. 
This mapping is one-to-one.

> r (read): 4
> w (write): 2
> x (execute): 1
