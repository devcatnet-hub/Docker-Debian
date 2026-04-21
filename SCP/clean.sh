#!/bin/bash

### Universal
    apt clean
    apt autoclean
    apt autoremove -y
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* /var/log/*

### Specific
    # apt remove tzdata -y
