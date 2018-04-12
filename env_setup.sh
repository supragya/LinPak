#!/bin/bash

# Copyright 2018, Supragya Raj
# LinuxPackages under MIT Licence

# add here any other routines before the env setup

if [ $(uname -s) == "Linux" ]; then
    declare -a distributions=("Manjaro" "Ubuntu" "Arch");
    declare -a distpackagemgrs=("1" "0" "1");
    declare -a packagemgr=("apt-get" "pacman");

    dist_count=${#distributions[*]}
    usable_mgr="-1"

    dist_name=$(lsb_release -a);

    for (( i=0; i<=$(( $dist_count -1 )); i++ ))
        do
        if [ $(echo "$dist_name" | grep -c "${distributions[$i]}") -gt 0 ]; then
            usable_mgr=${distpackagemgrs[$i]}
            echo "Found Distribution ${distributions[$i]}, will use ${packagemgr[usable_mgr]}"
        fi
    done

    if [ $usable_mgr == "-1" ]; then
        echo "Err: Linux distibution unknown, will use apt-get"
        usable_mgr="0"
    fi

    case $usable_mgr in
        "0")
        echo "-- apt-get install --"
        # add here for apt-get command
        sudo apt-get install cmake

        ;;
        "1")
        echo "-- pacman installation --"
        # add here for pacman command
        sudo pacman -S cmake

        ;;
    esac
fi

# add here any other routines after the env setup
