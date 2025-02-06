#!/usr/bin/env python3
import keyring

def get_password_keyring(service, username):
    return keyring.get_password(service, username)

if __name__ == "__main__":
    print(keyring.get_password("email", "jonathan@terracrypt.net"))
