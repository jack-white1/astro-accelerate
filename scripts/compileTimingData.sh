#!/bin/bash

echo "TIMING DATA USING RANGE SPECIFIC PARAMS"
echo "Range, Time"
for range in {0,1,2,3,4,5,6,7}
do
	grep "TIME_PER_RANGE" profile_optimum$1/params_$range.dat \
	| awk -F " " '{print $3" "$5}' \
	| awk -v var="$range" -F " " '{if ($1==var) print $2}' \
	| awk -v var="$range" '{s+=$1} END {print var ", " s}'
done


echo
echo "TIMING DATA USING AVERAGE PARAMS"
echo "Range, Time"
for range in {0,1,2,3,4,5,6,7}
do
	grep "TIME_PER_RANGE" profile_optimum_averaged$1/params_averaged.dat \
	| awk -F " " '{print $3" "$5}' \
	| awk -v var="$range" -F " " '{if ($1==var) print $2}' \
	| awk -v var="$range" '{s+=$1} END {print var ", " s}'
done
