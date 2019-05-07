#!/bin/bash 

printf "Start time: "; /bin/date 
printf "Job is running on node: "; /bin/hostname 
printf "Job running with user id: "; /usr/bin/id 
printf "Job is running in directory: "; /bin/pwd 

echo "SO version:"
cat /etc/issue
cat /etc/redhat-release

echo "Show relevant environment:"
echo "If the word \"local\" is shown, we are running on a local pilot"
echo "GLIDECLIENT_Group = $GLIDECLIENT_Group"
echo "GLIDECLIENT_Name = $GLIDECLIENT_Name"


if [ "x$GLIDECLIENT_Group" = "xlocal_users" ]; then
    echo "Job running on a local pilot as user: $USER"
else
    echo "Could not find local pilot environment. Running as user: $USER "
fi

if [ -e $_CONDOR_SCRATCH_DIR/.machine.ad ]; then 
    echo "---- Printing machine ads ----"
    cat .job.ad
    echo "--------------------------"
fi

if [ -e $_CONDOR_SCRATCH_DIR/.job.ad ]; then 
    echo "---- Printing job ads ----"
    cat .job.ad
    echo "--------------------------"
fi

sleep 3600
sleep ${1-15}
