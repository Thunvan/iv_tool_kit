
read -n1 -p "Press any key to continue..."

namePath="./testSeq"
seqPath="./testSeq"

for loopCnt in A B C
do
	mkdir -p tmp_${loopCnt}
	mid_dir=./tmp_${loopCnt}
	logPath=$mid_dir
	
	result_name=result_${loopCnt}.txt
	log_file=$logPath/${result_name}

	echo ---------------StartTest------------------- 1>${log_file}	
	echo  1>>${log_file}


	:<<COMMIT
	Here is multi commit
	Here is multi commit
	Here is multi commit
COMMIT

	
	testCnt=1

	for file in ${namePath}/*.txt
	do
		echo $file	
		fileName=${file%.txt}
		fileName=${fileName##*/}
		echo $fileName	
		
		echo $mid_dir		
		
		./doAlgo.sh $mid_dir $seqPath/$fileName.txt $fileName $loopCnt $testCnt $log_file
		
		testCnt=`expr $testCnt + 1`	
		
		#read -n1 -p "Press any key to continue..."

	done
	
	#rm $log_file
	rm -r $mid_dir

done

read -n1 -p "Press any key to end"

