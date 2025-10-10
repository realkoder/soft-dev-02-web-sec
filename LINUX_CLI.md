# NOTES AND LINKS FOR LINUX STUFF

`2>dev/null` When you combine these elements,
`2>/dev/null` redirects the standard error output (usually error messages) of a command to `/dev/null`,
effectively silencing any error messages that would have been displayed on the terminal.

It is very useful when finding files or directories that is out of scope for given user won't be printed

---

**PS**: To see the processes run by other users and those that don't run from a session
(i.e. system processes), we need to provide aux to the ps command like so: `ps aux`

Use `fg` to bring back ctl+z process

---

## THM ROOM

This THM room is brilliant for Linux hack such as awk, sed, sort, uniq...
**_linuxmodules_**

---

## awk

So awk is for changing the content of strings where different arguments can be passed and
change the way a string from given file will print...

**_STROPS_** = string operations

**_sed_**: sed is great for that just like awt

---

## CHATGPT's take on _awk_ and _sed_ is similar?:

In summary, both _sed_ and _awk_ are powerful tools for text manipulation and processing in _Linux_,
but they have different strengths.

Use _sed_ for simpler line-based text transformations and _awk_ for more complex data manipulation and
analysis tasks, especially involving structured data.

---

**_sort_**: obviously for sorting and used with _UNIQ_ it gets pretty powerful

**_xargs_**: _xargs_ is fucked!!!
ls where alldirectory is used as an argument for the following `sh -c echo word` and then `rm word` is used

`ls | xargs -I word -n 1 -t sh -c "echo word >> shortrockyou: rm word"`

**_--_**: IF DEALING WITH `--` in file names e.g. `--example.txt` then to delete it: `rm -- --example.txt`
so to escape `--` in file names etc. use `-- [--....]`

`passwd -m sha-512 <passwd>`: generates a _sha-512_ hash for the given password

**_ssh-keygen_**: This is used for generating _ssh keypar (rsa keys)_

In order to use a private SSH key, the permissions must be set up correctly
otherwise your SSH client will ignore the file with a warning.
Only the owner should be able to read or write to the private key (600 or stricter).
`ssh -i keyNameGoesHere user@host` is how you specify a key for the standard _Linux OpenSSH client_.

---

<br>

# Copying from machine to another by scp

SCP (Secure Copy) - Simple method:

Find vm ip by `ip addr show`

```bash
# Copy FROM VM TO your local machine
scp username@vm_ip:/path/to/file/on/vm /path/on/your/local/machine

# Example:
scp user@192.168.1.100:/home/user/document.txt ~/Downloads/
```

