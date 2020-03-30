#! /usr/bin/env bash

function help {
    cat << __EOF__

    usage: storage ls | status <device> | fs |
                         unplug | check <device> | repair <device> | help

    Commands:

    ls: lists all available disks
    status: shows information about the consulted device
    fs: lists all available filesystems
    unplug: unmounts ALL volumes [potentially dangerous]
    check: Check & Verify both disks or volumes available
    repair: Repairs a given volume
    help: show this message

__EOF__
}

function list {
    if [ -z "${1}" ]; then
        lsblk
    else
        lsblk "${1}"
    fi
}

function status {
    [ -z "${1}" ] && help && exit 1
    fdisk "${1}"
}

function filesys {
    
}

function unplug {
    echo "WARNING THIS WILL UNMOUNT ALL DRIVES AT ONCE ARE YOU SURE?"
    sudo umount -a
}

case $1 in
    help)  help ;;
    ls) shift list ;;
    status) shift status ;;
    fs) shift filesys ;;
    unplug) shift unplug ;;
    check) shift check "$@" ;;
    repair) shift repair "$@" ;;
    *) help ;;

esac

# 2020 - VentGrey