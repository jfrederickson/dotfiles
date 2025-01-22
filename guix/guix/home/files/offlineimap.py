#!/usr/bin/env python3
import re, os

def get_password_emacs(machine, login, port):
    s = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
    p = re.compile(s)
    with open(os.path.expanduser("~/.authinfo")) as f:
        authinfo = f.read()
    #authinfo = os.popen("gpg -q --no-tty -d ~/.authinfo.gpg").read()
    return p.search(authinfo).group(1)
