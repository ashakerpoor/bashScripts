#!/bin/bash

names='0.062 0.085 0.200'
srcdir1="/external1/alireza/andrea-cnf/lammps/N3k/parent_t0p062/config1"
srcdir2="/users3/alireza3/elastic/ipl/ANDREAALL/AndreaConfs/N3000"
dstdir="/external1/alireza/andrea-cnf/lammps/N3k"
for name in $names
do
	cd $dstdir
	mkdir $name
	for num in {1..5}
	do
		cd $dstdir/$name
		mkdir config$num
		cd $dstdir/$name/config$num
		cp $srcdir1/"atomID.dat" .
		cp $srcdir1/"hist" .
		cp $srcdir1/"in.minimize" .
		cp $srcdir1/"lmp_mpin" .
		cp $srcdir2/$name/"Cnf-"$num .
	done
done
echo All done
