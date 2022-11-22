#!/bin/bash

ex_num=${1:-0}

if [ $ex_num -eq 0 ]
then
for curr_ex_num in {1..5}
do
	echo Running ex{$curr_ex_num} tests:
	for test_num in {1..100}
	do
		./run_test.sh ex${curr_ex_num}.asm tests/ex${curr_ex_num}_test_${test_num} ex${curr_ex_num}_test_${test_num}
	done
done
elif [ $ex_num -gt 0 ] && [ $ex_num -lt 6 ]
then
	echo Running ex${ex_num} tests:
	for test_num in {1..100}
	do
		./run_test.sh ex${ex_num}.asm tests/ex${ex_num}_test_${test_num} ex${ex_num}_test_${test_num}
	done
else
	echo Invalid input, Please enter a number from 1-5 or nothing to run all tests.
fi
