#!/bin/bash

state=`pbsnodes $* |grep state`

if [[ $state == *free* || $state == *offline* ]]
then
  echo $state | cut -d\= -f2
fi

{
for i in `pbsnodes $* |grep jobs | cut -d\= -f2 ` 
do

jobnum=`echo $i | cut -d\/ -f1`

qstat -f $jobnum |awk '

/resources_used.walltime/ {
  split($3,t,":"); 
  used = (t[1]*3600) + (t[2]*60) + t[3] 
}
/Resource_List.walltime/ { 
  split($3,t,":"); 
  req = (t[1]*3600) + (t[2]*60) + t[3] 
}
END { 
  time = (req - used); 
  printf("%02d:%02d:%02d\n", time/3600, time%3600/60, time%60 ) 
}
 ' 

done

} | sort -n
