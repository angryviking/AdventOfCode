#!/bin/bash

input=day7.txt
output=day7_out.txt
rm -rf ${output}

# this loop turns every line in input into an expression with variables
# this also reads from the end of the input to the beginning
tac ${input} | while read line; do 
  echo ${line} | sed -r 's/^(\S+) (\S+) bags contain /\1_\2=$((/g' | \
  sed -r 's/([0-9]+) (\S+) (\S+) bags?,/(\1*${\2_\3}) +/g' | \
  sed -r 's/([0-9]+) (\S+) (\S+) bags?./(\1*${\2_\3}) + 1))/g' | \
  sed 's/no other bags./1))/g' >> ${output}
done

# the outputted variables need to be an heiarchial order which I still need to figure out a place here
# I was able to  manually copy the variables from the output in order to answer the puzzle
#muted_silver=$((1))
#mirrored_yellow=$((1))
#muted_violet=$((1))
#mirrored_aqua=$((1))
#light_silver=$((1))
#posh_red=$((1))
#bright_white=$((1))
#shiny_green=$((1))
#dull_silver=$((1))
#vibrant_plum=$((1))
#bright_blue=$(((5*${mirrored_yellow}) + (5*${light_silver}) + 1))
#muted_fuchsia=$(((1*${bright_blue}) + 1))
#vibrant_red=$(((2*${muted_fuchsia}) + (5*${bright_blue}) + 1))
#faded_lavender=$(((1*${mirrored_yellow}) + (4*${vibrant_plum}) + 1))
#dark_gray=$(((2*${bright_white}) + (2*${posh_red}) + 1))
#pale_yellow=$(((3*${dull_silver}) + (1*${shiny_green}) + (5*${muted_silver}) + 1))
#wavy_beige=$(((2*${muted_violet}) + (1*${bright_white}) + (5*${vibrant_red}) + (1*${faded_lavender}) + 1))
#dark_aqua=$(((5*${wavy_beige}) + (3*${pale_yellow}) + (2*${bright_white}) + (2*${muted_violet}) + 1))
#dull_black=$(((1*${dark_gray}) + (1*${mirrored_yellow}) + (4*${dark_aqua}) + 1))
#muted_white=$(((5*${mirrored_aqua}) + (2*${muted_fuchsia}) + 1))
#wavy_olive=$(((4*${muted_white}) + (5*${muted_silver}) + 1))
#dotted_lime=$(((5*${light_silver}) + (1*${shiny_green}) + (1*${mirrored_aqua}) + 1))
#posh_fuchsia=$(((5*${dark_aqua}) + (1*${muted_white}) + (2*${shiny_green}) + (5*${dull_black}) + 1))
#drab_blue=$(((2*${dark_gray}) + (4*${dotted_lime}) + (3*${shiny_green}) + (3*${wavy_olive}) + 1))
#pale_indigo=$(((5*${drab_blue}) + (3*${posh_fuchsia}) + 1))
#shiny_gold=$(((1*${pale_indigo}) + (3*${pale_yellow}) + 1))

# in theory, I should be able to read the variables from the output file using the source command
source ${output}
echo $((${shiny_gold} -1)
