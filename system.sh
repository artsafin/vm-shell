#!/bin/bash

if ! grep "Europe/Athens" /etc/timezone; then
    echo "Europe/Athens" > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata;
fi

