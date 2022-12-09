#!/bin/bash

#This part of the script invokes the check-disk-usage.sh script onto a remote machine using key authentication and places the output in a txt file
ssh -i /path-to-private-key/key.pem user@host-name sh -s < /path-to-script/check-disk-usage.sh > /path-to-file/disk-usage.txt

#This part of the script checks the output of the command above. If there is no content, the script ends. If there is an output in the file, the script emails its contents.
usage_file=/path-to-file/disk-usage.txt
if [ -s ${usage_file} ] ; then
mail -s "Disk Usage Problems" -a "From: Name_Of_Sender <sender@yourdomain.com>" receiver@hisdomain.com < /path-to-file/disk-usage.txt
fi