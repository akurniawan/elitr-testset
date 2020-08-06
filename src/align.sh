#!/bin/bash

mt=$1
ostt=$2
tt=$3
path=$4

#SLTev requires files to be in certain directories, so we need to cp and cd
cp $tt ./src/SLTev/giza-pp/run_giza/tt
cd ./src/SLTev
python3 giza++/transcript_to_source.py ../../$ostt > ./giza-pp/run_giza/source_ref

cd giza-pp/run_giza
bash run.sh tt source_ref ./out_folder 1>/dev/null 2>/dev/null #output only to the folder
cat out_folder/Result.A3.final > ../../../../$path.align

#delete temporary files
rm -rf ./out_folder/*
rm ./*source_ref*
rm ./*tt*
