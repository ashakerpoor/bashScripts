#!/bin/bash
#Run in parallel
names='0.062 0.085 0.200'
srcdir1="/external1/alireza/andrea-cnf/lammps/N3k/parent_t0p062/config1"
srcdir2="/users3/alireza3/elastic/ipl/ANDREAALL/AndreaConfs/N3000"
dstdir="/external1/alireza/andrea-cnf/lammps/N3k"
for name in $names
do
	for num in {1..5}
	do
		cd $dstdir/$name/config$num/"t1e-5"
		if [ $PWD == "/external1/alireza/andrea-cnf/lammps/N3k/0.062/config1/t1e-5" ]; then
			continue
		else
			mpiexec -n 16 "./lmp_mpin" < "in.equilibrate" > "output" &
			sleep 4800
		fi
	done
done
echo All done
