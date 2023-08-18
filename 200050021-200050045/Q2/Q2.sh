#!/bin/sh

awk '
	BEGIN {
		n =1
		num = 1
		check = 1
		}
	{
		for (x=1;x<=NF;x++){
			check = 0
			if(num >1){
				for( y=1;y<num;y++ ){
					if ( store[y-1] == $x){
						check = 1
						if(x!=NF){printf("%d ",y-1)}
						else if(x==NF){printf("%d",y-1)}
						break;
					}
				}
			}
			if(check == 0){
				store[num-1] = $x
				if(x!=NF){printf("%d ",num-1)}
				else if(x==NF){printf("%d",num-1)}
				num = num +1;
			}
		};
		printf "\n"
	}' sample.txt > output.txt
