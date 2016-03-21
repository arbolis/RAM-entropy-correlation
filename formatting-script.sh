#!/bin/bash
sed -n 1~2p RAM-data2.txt >> formatted-for-R.txt  #prints the odd lines 
sed -n 2~2p RAM-data2.txt >> formatted2-for-R.txt # prints the even lines
awk '{ print $3 }' formatted-for-R.txt >> formatted1-for-R.txt


