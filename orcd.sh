#! /usr/bin/env bash


[ -L $0 ] && pushd "$(readlink "$0" | xargs dirname)" > /dev/null \
    || pushd "$(dirname "$0")" > /dev/null || exit
OPATH=$(pwd -P)
export OPATH
popd > /dev/null || exit

function use {
    cat << __EOF__

   ❀  O R C H I D  ❀

   A personal script for common server tasks

   usage: orcd [BREED] [OPTIONS] or type "--help" to view this screen
          or command help usage.

          OPTIONS:
            help

          BREEDS:
__EOF__

    for i in ${OPATH}/breeds/*; do
        [ ! -L "$i" -a -f "$i" ] && echo "            ${i##*/}"
    done

    [ "${OPTIONS}" == "help" ] && exit 0 || exit 1
   
}

OPTIONS=$1; shift;

[ ! -f "${OPATH}/breeds/${OPTIONS}" ] && use
"${OPATH}"/breeds/"${OPTIONS}" "$@"

# Orchid 2020 - VentGrey
