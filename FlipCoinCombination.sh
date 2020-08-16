#!/bin/bash


read -p "How many Times you want to Flip the Coin:" Limit
declare -A Singlet
for (( i=0; i<Limit; i++ ))
do
        num=$((RANDOM%2))
        if [[ $num -eq 0 ]]
        then
                Singlet[$i]=`echo Heads`
                ((count_H++))
        else
                Singlet[$i]=`echo Tails`
                ((count_T++))
        fi
done
echo -e "\nSinglet Combination:\n"${Singlet[@]}
echo -e "\nHeads have been faced $count_H times"
echo -e "\nTails have been faced $count_T times"
echo -e "\nHeads Percent=" $(($count_H*100/$Limit))
echo -e "\nTails Percent=" $(($count_T*100/$Limit))
