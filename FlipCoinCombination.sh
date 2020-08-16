#!/bin/bash


read -p "How many Times you want to Flip the Coin:" Limit
declare -A Triplet
for (( i=0; i<Limit; i++ ))
do
        num=$((RANDOM%8))
        if [[ $num -eq 0 ]]
        then
                Triplet[$i]=`echo HHH`
                ((count_HHH++))
	elif [[ $num -eq 1 ]]
        then
		 Triplet[$i]=`echo HHT`
                ((count_HHT++))
        elif [[ $num -eq 2 ]]
	then
		Triplet[$i]=`echo HTH`
                ((count_HTH++))
	elif [[ $num -eq 3 ]]
        then
                Triplet[$i]=`echo THH`
                ((count_THH++))
        elif [[ $num -eq 4 ]]
        then
                Triplet[$i]=`echo HTT`
                ((count_HTT++))
        elif [[ $num -eq 5 ]]
        then
                Triplet[$i]=`echo THT`
                ((count_THT++))
        elif [[ $num -eq 6 ]]
        then
                Triplet[$i]=`echo TTH`
                ((count_TTH++))
        else
                Triplet[$i]=`echo TTT`
                ((count_TTT++))
        fi
done
echo -e "\nTriplet Combination:\n"${Triplet[@]}
echo -e "\nHHH have been faced $count_HHH times"
echo -e "\nHHT have been faced $count_HHT times"
echo -e "\nHTH have been faced $count_HTH times"
echo -e "\nTHH have been faced $count_THH times"
echo -e "\nHTT have been faced $count_HTT times"
echo -e "\nTHT have been faced $count_THT times"
echo -e "\nTTH have been faced $count_TTH times"
echo -e "\nTTT have been faced $count_TTT times"
echo -e "\nHHH Percent=" $(($count_HHH*100/$Limit))
echo -e "\nHHT Percent=" $(($count_HHT*100/$Limit))
echo -e "\nHTH Percent=" $(($count_HTH*100/$Limit))
echo -e "\nTHH Percent=" $(($count_THH*100/$Limit))
echo -e "\nHTT Percent=" $(($count_HTT*100/$Limit))
echo -e "\nTHT Percent=" $(($count_THT*100/$Limit))
echo -e "\nTTH Percent=" $(($count_TTH*100/$Limit))
echo -e "\nTTT Percent=" $(($count_TTT*100/$Limit))

