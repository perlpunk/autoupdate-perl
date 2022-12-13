#!/bin/bash

case "$1" in
    -h|--help)
        echo "Wrapper for bin/status && bin/update"
        exit
    ;;
esac

DIR="$( dirname ${BASH_SOURCE[0]} )/.."
cd $DIR

./bin/status --data ~/obs-mirror --project devel:languages:perl:CPAN- --update

for LETTER in A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
do
    echo $LETTER
    ./bin/update \
        --data ~/obs-mirror \
        --project devel:languages:perl:CPAN- \
        --max 20 \
        --cpanspec "${CPANSPEC:-cpanspec}" \
        $LETTER
done
