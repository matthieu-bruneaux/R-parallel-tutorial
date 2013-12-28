#! /bin/bash -eu

declare -a files=(analysis_big_data \
                  analysis_big_data_parallel \
                  analysis_long \
                  analysis_simple \
                  analysis_all)

for f in ${files[@]}
do
	inkscape -f ${f}.svg -A ${f}.pdf
done
