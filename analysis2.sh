#!/bin/bash

names='parent_t0p2'
numbers='53'
boxes='box3_grid4 box6_grid4 box8_grid3 box11_grid3'
dstdir="/external3/alireza/andrea-cnf/analysis/N48k"
srcdir="/external3/alireza/andrea-cnf/lammps/N48k"
for name in $names
do
	for num in $numbers
	do
		for box in $boxes
		do
			cd $dstdir/$name/config$num/$box
			cp -r "15M_ts" "temp"
			cd "temp"
			gcc "analysis2.c" -lm
			sleep 5
			./"a.out" 1 $srcdir/$name/config$num/"t1e-5"/"15M_ts"/ > "output" 2>"errfile" &
		done
	done
done
echo All done
