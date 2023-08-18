# !/bin/bash
 
#  sed 's/Joined/:Joined:/' sample.csv > out1.txt
#  sed 's/Left/:Left:/' out1.txt > out2.txt
#  sed 's/, /:/' out2.txt > out3.txt
 awk '{sub("Joined", ":Joined:");print $0;}' $1 > out1.txt
 awk '{sub("Left", ":Left:"); print $0;}' out1.txt > out2.txt
 awk '{sub(", ", ":"); print $0;}' out2.txt > out3.txt

# cat out3.txt|dos2unix|sed 's/^/:/;s/$/:/' > out4.txt
 cat out3.txt|dos2unix|awk '{printf(":%s:\n", $0);}' > out4.txt

 echo $2 > out5.txt
 start=$(awk -F: '{print ($1*3600)+($2*60)+($3)}' out5.txt);
 #echo $start;
 echo $3 > out6.txt
 stop=$(awk -F: '{print ($1*3600)+($2*60)+($3)}' out6.txt);
 #echo $stop;

 awk -v x=$start -v y=$stop '
    BEGIN{
        FS = ":";
        OFS = ":";
    }
    (NF == 8){
        time = $5*3600 + $6*60 + $7;

        start = x;
        stop = y;

        if($3=="Joined"){
            if(time<=start){
                name[$2] = name[$2] - start;
            }
            if(time>start && time<stop){
                name[$2] = name[$2] - time;
            }
            if(time>=stop){
                name[$2] = name[$2] - stop;
            }

        }
        if($3=="Left"){
            if(time<=start){
                name[$2] = name[$2] + start;
            }
            if(time>start && time<stop){
                name[$2] = name[$2] + time;
            }
            if(time>=stop){
                name[$2] = name[$2] + stop;
            }
        }
        
    }


    END{
        for(i in name){
            if(name[i]<0){
                name[i] = name[i] + stop;
                }
            else{
                name[i] = name[i];
            }
            a = (name[i]-(name[i]%3600))/3600;
            b = ((name[i]%3600)-((name[i]%3600)%60))/60;
            c = (name[i]%3600)%60;

            if(a<10 && b<10 && c<10){
                print i" ", "0"a, "0"b, "0"c;
            }
            else if(a<10 && b<10){
                print i" ", "0"a, "0"b, c | "sort -nk1" ;
            }
            else if(b<10 && c<10){
                print i" ", a, "0"b, "0"c | "sort -nk1" ;
            }
            else if(a<10 && c<10){
                print i" ", "0"a, b, "0"c | "sort -nk1" ;
            }
            else if(a<10){
                print i" ", "0"a, b, c | "sort -nk1";
            }
            else if(b<10){
                print i" ", a, "0"b, c | "sort -nk1";
            }
            else if(c<10){
                print i" ", a, b, "0"c | "sort -nk1";
            }
            else{
                print i" ", a, b, c | "sort -nk1";
            }
            
        }
    }
    
    ' out4.txt > out9.txt

 #sed 's/ ://g' out9.txt > output.txt
 awk '{sub(" :", ""); print $0}' out9.txt > output.txt

 rm out1.txt
 rm out2.txt
 rm out3.txt
 rm out4.txt
 rm out5.txt
 rm out6.txt
 rm out9.txt



# awk '
#     BEGIN{
#         FS = ":";
#     }
#     END{
#         print 
#     }
# '