#!/bin/sh

N=$1


awk -v N="$N" -F'[|:]' '
	function find_max(arr,n){
	   k = 0
	   for(i=0;i<n;i++){
			if(arr[i]>k){
				k = arr[i]
			}		   	
	   }
	   return k
	}
	function find_elem(arr,n,t){
	   z = -1
	   for(i=0;i<n;i++){
			if(arr[i]== t){
				z = i
				arr[i] = 0
				break
			}		   	
	   }
	   return z
	}
	BEGIN{
		n = 0
		ns = 0
		m = 1
		}
	{	
		if($1 == 0){
			for(x=2;x<=NF;x++){
				m = 0
				if(n >0){
					for( y=0;y<n;y++ ){
						if ( ham[y] == $x ){
							freq_h[y] = freq_h[y]+1
							m = 1
							break;
						}
						}
					}
				if(m == 0){
					ham[n] = $x
					freq_h[n] = 1
					n = n+1
				}
			}
		}
		if($1 == 1){
			for(x=2;x<=NF;x++){
				m = 0
				if(ns >0){
					for( y=0;y<ns;y++ ){
						if ( spam[y] == $x ){
							freq_s[y] = freq_s[y]+1
							m = 1
							break;
						}
					}
					}
				if(m == 0){
					spam[ns] = $x
					freq_s[ns] = 1
					ns = ns+1
					
				}
			}
			
		}
	}
	
	END{
		t = 0
		while(t<N){
			e = find_max(freq_s,ns)
			if(e == 0){break}
			while(1){
				i = find_elem(freq_s,ns,e)
				if(i== -1){
					break
				}
				else{
					index_s[t] = i
					k = 10
					j = 11
					printf("%d %d\n",spam[i],e)
					t= t+1
				}
			}
		}
	}' sample.txt > rspam.txt
	
awk -v N="$N" -F'[|:]' '
	function find_max(arr,n){
	   k = 0
	   for(i=0;i<n;i++){
			if(arr[i]>k){
				k = arr[i]
			}		   	
	   }
	   return k
	}
	function find_elem(arr,n,t){
	   z = -1
	   for(i=0;i<n;i++){
			if(arr[i]== t){
				z = i
				arr[i] = 0
				break
			}		   	
	   }
	   return z
	}
	BEGIN{
		n = 0
		ns = 0
		m = 1
		}
	{	
		if($1 == 0){
			for(x=2;x<=NF;x++){
				m = 0
				if(n >0){
					for( y=0;y<n;y++ ){
						if ( ham[y] == $x ){
							freq_h[y] = freq_h[y]+1
							m = 1
							break;
						}
						}
					}
				if(m == 0){
					ham[n] = $x
					freq_h[n] = 1
					n = n+1
				}
			}
		}
		if($1 == 1){
			for(x=2;x<=NF;x++){
				m = 0
				if(ns >0){
					for( y=0;y<ns;y++ ){
						if ( spam[y] == $x ){
							freq_s[y] = freq_s[y]+1
							m = 1
							break;
						}
					}
					}
				if(m == 0){
					spam[ns] = $x
					freq_s[ns] = 1
					ns = ns+1
					
				}
			}
			
		}
	}
	
	END{
		t = 0
		while(t<N){
			e = find_max(freq_h,n)
			if(e == 0){break}
			while(1){
				i = find_elem(freq_h,n,e)
				if(i== -1){
					break
				}
				else{
					index_h[t] = i
					k = 10
					j = 11
					printf("%d %d\n",ham[i],e)
					t= t+1
				}
			}
		}
	}' sample.txt > rham.txt
	
awk -v N="$N" -F'[|:]' '
	function find_max(arr,n){
	   k = 0
	   for(i=0;i<n;i++){
			if(arr[i]>k){
				k = arr[i]
			}		   	
	   }
	   return k
	}
	function find_elem(arr,n,t){
	   z = -1
	   for(i=0;i<n;i++){
			if(arr[i]== t){
				z = i
				arr[i] = 0
				break
			}		   	
	   }
	   return z
	}
	BEGIN{
		n = 0
		ns = 0
		m = 1
		}
	{	
		if($1 == 0){
			for(x=2;x<=NF;x++){
				m = 0
				if(n >0){
					for( y=0;y<n;y++ ){
						if ( ham[y] == $x ){
							freq_h[y] = freq_h[y]+1
							m = 1
							break;
						}
						}
					}
				if(m == 0){
					ham[n] = $x
					freq_h[n] = 1
					n = n+1
				}
			}
		}
		if($1 == 1){
			for(x=2;x<=NF;x++){
				m = 0
				if(ns >0){
					for( y=0;y<ns;y++ ){
						if ( spam[y] == $x ){
							freq_s[y] = freq_s[y]+1
							m = 1
							break;
						}
					}
					}
				if(m == 0){
					spam[ns] = $x
					freq_s[ns] = 1
					ns = ns+1
					
				}
			}
			
		}
	}
	
	END{
		t = 0
		while(t<N){
			e = find_max(freq_h,n)
			if(e == 0){break}
			print e
			while(1){
				i = find_elem(freq_h,n,e)
				if(i== -1){
					break
				}
				else{
					index_h[t] = i
					k = 10
					j = 11
					t= t+1
				}
			}
		}
	}' sample.txt > freq_ham.txt
	
awk -v N="$N" -F'[|:]' '
	function find_max(arr,n){
	   k = 0
	   for(i=0;i<n;i++){
			if(arr[i]>k){
				k = arr[i]
			}		   	
	   }
	   return k
	}
	function find_elem(arr,n,t){
	   z = -1
	   for(i=0;i<n;i++){
			if(arr[i]== t){
				z = i
				arr[i] = 0
				break
			}		   	
	   }
	   return z
	}
	BEGIN{
		n = 0
		ns = 0
		m = 1
		}
	{	
		if($1 == 0){
			for(x=2;x<=NF;x++){
				m = 0
				if(n >0){
					for( y=0;y<n;y++ ){
						if ( ham[y] == $x ){
							freq_h[y] = freq_h[y]+1
							m = 1
							break;
						}
						}
					}
				if(m == 0){
					ham[n] = $x
					freq_h[n] = 1
					n = n+1
				}
			}
		}
		if($1 == 1){
			for(x=2;x<=NF;x++){
				m = 0
				if(ns >0){
					for( y=0;y<ns;y++ ){
						if ( spam[y] == $x ){
							freq_s[y] = freq_s[y]+1
							m = 1
							break;
						}
					}
					}
				if(m == 0){
					spam[ns] = $x
					freq_s[ns] = 1
					ns = ns+1
					
				}
			}
			
		}
	}
	
	END{
		t = 0
		while(t<N){
			e = find_max(freq_s,ns)
			if(e == 0){break}
			print e
			while(1){
				i = find_elem(freq_s,ns,e)
				if(i== -1){
					break
				}
				else{
					index_h[t] = i
					k = 10
					j = 11
					t= t+1
				}
			}
		}
	}' sample.txt > freq_spam.txt

awk '
	BEGIN {
		FS="-"
	}
	{
		printf("%s %d\n",$1,$2)
	}' word_token_mapping.txt > token.txt
	


while IFS= read -r p|| [[ -n "$p" ]]; do
	awk -v p="$p"   '
	BEGIN{
		i = 0
	}
	NR == FNR{
		freq[i] = $2
		elem_code[i] = $1
		i = i+1
	}
	NR!=FNR{
		for(j=0;j<i;j++){
			if(freq[j] == p && $2 == elem_code[j]){
				print $1
			}
			}
	}
	' rham.txt token.txt >> output_hhham.txt
done < freq_ham.txt 

	
awk -v N="$N" '
	FNR<=N{
		print $0
	}
' output_hhham.txt > output_hham.txt

cat output_hham.txt > ham.txt

while IFS= read -r p|| [[ -n "$p" ]]; do
	awk -v p="$p"   '
	BEGIN{
		i = 0
	}
	NR == FNR{
		freq[i] = $2
		elem_code[i] = $1
		i = i+1
	}
	NR!=FNR{
		for(j=0;j<i;j++){
			if(freq[j] == p && $2 == elem_code[j]){
				print $1
			}
			}
	}
	' rspam.txt token.txt >> output_ssspam.txt
done < freq_spam.txt


awk -v N="$N" '
	FNR<=N{
		print $0
	}
' output_ssspam.txt > output_sspam.txt

cat output_sspam.txt > spam.txt

rm freq_ham.txt
rm freq_spam.txt
rm rham.txt
rm output_hham.txt
rm output_hhham.txt
rm output_sspam.txt
rm output_ssspam.txt
rm token.txt
rm rspam.txt






