#! /bin/bash -eu

# Convert an Rnw file to a pdf file
#
# Arguments
# input file name (foo.Rnw)

# http://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash



# parse the input file name

input_file=$(basename "$1")

extension="${input_file##*.}"

file_name="${input_file%.*}"

# parse the bibtex file

if [ $# -eq 2 ]
    then
    
    bib_file=$(basename "$2")
    
    bib_extension="${bib_file##*.}"

    bib_file_name="${bib_file%.*}"

fi


# make the forge directory

mkdir -p ./sweave_forge



# copy the source file to the forge directory and compile it

cp *.Rnw ./sweave_forge

cd ./sweave_forge

R CMD Sweave $input_file

pdflatex $file_name.tex

# bibtex

if [ $# -eq 2 ]
    then
    
    cp ../$bib_file ./
    
    bibtex $file_name.aux

fi

cd ..

cp ./sweave_forge/$file_name.pdf ./


