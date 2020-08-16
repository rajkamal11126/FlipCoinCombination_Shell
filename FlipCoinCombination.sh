#!/bin/bash


read -p "How many Times you want to Flip the Coin:" Limit
declare -A Doublet
for (( i=0; i<Limit; i++ ))
do
        num=$((RANDOM%4))
        if [[ $num -eq 0 ]]
        then
                Doublet[$i]=`echo HH`
                ((count_HH++))
	elif [[ $num -eq 1 ]]
        then
		 Doublet[$i]=`echo HT`
                ((count_HT++))
        elif [[ $num -eq 2 ]]
	then
		Doublet[$i]=`echo TH`
                ((count_TH++))
        else
                Doublet[$i]=`echo TT`
                ((count_TT++))
        fi
done
echo -e "\nDoublet Combination:\n"${Doublet[@]}
echo -e "\nHH have been faced $count_HH times"
echo -e "\nHT have been faced $count_HT times"
echo -e "\nTH have been faced $count_TH times"
echo -e "\nTT have been faced $count_TT times"
echo -e "\nHH Percent=" $(($count_HH*100/$Limit))
echo -e "\nHT Percent=" $(($count_HT*100/$Limit))
echo -e "\nTH Percent=" $(($count_TH*100/$Limit))
echo -e "\nTT Percent=" $(($count_TT*100/$Limit))
