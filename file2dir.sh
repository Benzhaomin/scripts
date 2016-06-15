#!/bin/bash

# turns file.$1 into file/file.$1
#
# > ls
# file.mp4
# > ./dirs.sh mp4
# > ls -R
# file/file.mp4

for file in *.$1
do
    DIR=${file/.$1/}
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/./ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    DIR=${DIR/_/ }
    mkdir -p "$DIR"
    mv "$file" "$DIR"
done
