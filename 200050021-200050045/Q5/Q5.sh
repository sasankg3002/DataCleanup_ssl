#!/bin/bash

awk '
    BEGIN{
        FS = "<|>"; 
    }
    ($2~/div class="field field-name-field-select-state field-type-list-text field-label-above"/){
        state[$11] = state[$11] + $27;
       
    }
    END{
        for(i in state){
            print  "\""state[i]"\"" ,"\""i"\"" | "sort -rn" ; 
        }
    }
' covid_status.html > test.txt

cat sample.txt|dos2unix|sed 's/^/"/;s/$/"/' > sample1.txt

awk  '
    BEGIN{
        FS = "\"";
        
    }
    NR==FNR {out[$2]=1;  next} {if(out[$4]==1) print $4, ":"$2 | "sort -t: -nk2"}' sample1.txt test.txt > output1.txt

 sed 's/://g' output1.txt > output.txt

# awk '
#     BEGIN{
#         FS =":";
#     }
#     {print $1, $2}' output1.txt > output.txt


rm test.txt
rm sample1.txt 
rm output1.txt

 