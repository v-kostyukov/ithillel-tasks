#!/bin/bash

if nc -zv -w30 localhost $1 <<< '' &> /dev/null
then
        echo "[+] Port $1 is open"
else
        echo "[-] Port $1 is closed"
fi