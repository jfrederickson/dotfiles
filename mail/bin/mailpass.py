import subprocess
def mailpasswd(acct):
    try:
        return subprocess.check_output("pass mail/offlineimap/{} | head -1".format(acct), shell=True).strip()
    except subprocess.CalledProcessError:
        return ""
