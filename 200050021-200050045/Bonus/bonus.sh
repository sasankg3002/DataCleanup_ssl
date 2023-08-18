#!/bin/sh

sed 's/\s$//g' bonus_sample_input.txt > input.txt

awk '
	function conv_10(arr,n,base){
	   num_x = 0
	   for(i=0;i<n;i++){
	   		num_x = num_x*base + arr[i]
	   }
	   return num_x
	}
	function conv_base(num,base){
		n =0
		while(num>0){
			arr[n] = num%base
			num = int(num/base)
			n = n+1
		}
		for(i=0;i<n;i++){
			printf("%d ",arr[n-i-1])
		}
	}
	BEGIN{
		cases = 0
		in_base = 0
		out_base = 0
		num_1 = 0
		num_2 = 0
	}
	FNR==1{
		cases = $0
	}
	FNR!= 1{
		if(FNR%3==2){
			in_base = $1
			out_base = $2
		}
		else if(FNR%3==0){
			 n = NF
			 for(i=0;i<NF;i++){
			 	j = i+1		 	
			 	arr[i] = $j
			 	}
			 num1 = conv_10(arr,n,in_base)
		}
		else if(FNR%3==1){
			 n = NF
			 for(i=0;i<NF;i++){
			 	j = i+1
			 	arr[i] = $j
			 }
			 num2 = conv_10(arr,n,in_base)
			 num = num1+num2
			 conv_base(num,out_base)
			 print ""
		}
	}
' input.txt > output.txt

sed '
	s/\s\s*/ /g
	s/^\s//g
	s/\s$//g
	/^\s*$/d
	' output.txt > bonus_output.txt
	
rm output.txt
rm input.txt
	
