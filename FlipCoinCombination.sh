#!/bin/bash


read -p "How many Times you want to Flip the Coin:" Limit

declare -A Singlet
declare -A Doublet
declare -A Triplet
declare -A Percent

for (( i=0; i<Limit; i++ ))
do
        num=$((RANDOM%2))
        if [[ $num -eq 0 ]]
        then
                Singlet[$i]=`echo H`
                ((count_H++))
        else
                Singlet[$i]=`echo T`
                ((count_T++))
        fi
done

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
echo -e "\nSinglet Directory:\n"${Singlet[@]}
echo -e "\nH have been faced $count_H times"
echo -e "T have been faced $count_T times\n"
echo "H Percentage:" $(($count_H*100/$Limit))
echo "T Percentage:" $(($count_T*100/$Limit))

echo -e "\nDoublet Directory:\n"${Doublet[@]}
echo -e "\nHH have been faced $count_HH times"
echo "HT have been faced $count_HT times"
echo "TH have been faced $count_TH times"
echo -e "TT have been faced $count_TT times\n"
echo "HH Percentage:" $(($count_HH*100/$Limit))
echo "HT Percentage:" $(($count_HT*100/$Limit))
echo "TH Percentage:" $(($count_TH*100/$Limit))
echo "TT Percentage:" $(($count_TT*100/$Limit))

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

echo -e "\nSorted Percentage:\n"
echo ${Percent[@]} | tr " " "\n" | sort -n

IFS=$'\n' Sorted=($(sort -nr <<<"${Percent[*]}"))
unset IFS
for i in "${!Percent[@]}"
do
        [[ ${Sorted[0]} -ne ${Percent[$i]} ]] && continue
        echo -e "\nWining Combination: $i"
done
