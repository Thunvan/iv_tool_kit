
#$0:bashName  $1--$... parameters

echo "Enter doAlgo.sh"
echo $0 $1 $2 $3 $4 $5 $6

mid_dir=$1
src_seq=$2
seqPureName=$3
class=$4
test_cnt=$5
log_file=$6


outputCnt()
{
	fac=$(echo 'ibase=10;obase=10;scale=9; 1/2' | bc)
	recordCnt=$(echo 'ibase=10;obase=10;scale=9;' $1'*'$fac | bc)
	echo $0 $2 $1 $recordCnt 
	echo $0 $2 $1 $recordCnt 1>>${log_file}
}


outputName()
{
	awk -F':' '/CC/ {print "Content:"$0}' $1
	eval $(awk -F':' '/CC/ {print "content="$0}' $1)
	echo $content
	echo $0 $1 $content
	echo $0 $1 $content 1>>${log_file}
}


echo ----------------${src_seq}-----------No.$test_cnt--------- 1>>${log_file}


if [ 1 = $test_cnt -o 2 = $test_cnt ]
then
	outputCnt $test_cnt $src_seq
elif [ 3 = $test_cnt ]
then
	outputName $src_seq
else
	echo $test_cnt
fi	


#read -n1 -p "Press any key to continue..."

