#!/usr/bin/env bash
    cd src

# Sort list of names
SORTED="names_sorted.txt"
sort ../names.txt > $SORTED

# Read in preamble
TEXFILE=main.tex
cat preamble.tex > $TEXFILE
echo '\begin{document}' >> $TEXFILE

# Read in names
IFS=$'\n'
for NAME in $(cat $SORTED); do
    echo "\\barpage{$NAME}" >> $TEXFILE
done
echo '\end{document}' >> $TEXFILE

# Make the PDF and copy
pdflatex $TEXFILE && cp main.pdf ../battels_sheets.pdf
cd ..
