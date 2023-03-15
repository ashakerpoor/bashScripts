#!/bin/bash

names='0.062 0.085 0.200'
dstdir="/external1/alireza/andrea-cnf/analysis/N3k"
srcdir="/external1/alireza/andrea-cnf/lammps/N3k"
for name in $names
do
	for num in {1..5}
	do
		cd $dstdir/$name/config$num/"box2_grid7"/"10M_ts"
		mv $srcdir/$name/config$num/"sigma_file.dat" .
		icc "analysis1.c" -O3
		sleep 6
		./"a.out" 1 $srcdir/$name/config$num/"t1e-5/" > "output" 2>"errfile" &
                cd $dstdir/$name/config$num/"box4_grid5"/"10M_ts"
		cp $dstdir/$name/config$num/"box2_grid7"/"10M_ts"/"sigma_file.dat" .
                icc "analysis1.c" -O3
                sleep 6
                ./"a.out" 1 $srcdir/$name/config$num/"t1e-5/" > "output" 2>"errfile" &
	done
done
echo All done
