#!/bin/bash
#minimize "start.config" and make the t1e-5 directory with needed files.
names='0.062 0.085 0.200'
srcdir1="/external1/alireza/andrea-cnf/lammps/N3k/parent_t0p062/config1"
srcdir2="/users3/alireza3/elastic/ipl/ANDREAALL/AndreaConfs/N3000"
dstdir="/external1/alireza/andrea-cnf/lammps/N3k"
for name in $names
do
	for num in {1..5}
	do
		cd $dstdir/$name/config$num
		mpiexec -n 15 "./lmp_mpin" < "in.minimize" > "output" &
		sleep 4
		mkdir "t1e-5"
		cp $dstdir/$name/config$num/"minimized.config" $dstdir/$name/config$num/"t1e-5"
		cp $srcdir1/"t1e-5"/"in.equilibrate" $dstdir/$name/config$num/"t1e-5"
		cp $srcdir1/"t1e-5"/"lmp_mpin" $dstdir/$name/config$num/"t1e-5"
	done
done
echo All done
