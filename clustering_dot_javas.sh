#!/bin/bash
set -e
set -x

echo "Processing $f file...";
hash_value=$(/usr/bin/sha512sum $1)
hash_only=$(echo $hash_value | sed 's/[[:space:]]\S*//g')


src/jadx/bin/jadx $1

mkdir source_pool
find . -name *.java -exec mv {} {}.$hash_only \; -exec mv {}.$hash_only source_pool \;

source src/ssdc/bin/activate
ssdc source_pool
