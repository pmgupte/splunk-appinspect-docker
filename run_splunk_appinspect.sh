#!/bin/sh
echo "Running Splunk AppInspect version $AppInspectVersion"
splunk-appinspect inspect /home/splunk_apps/target_app.tar.gz --mode precert --included-tags splunk_appinspect --included-tags cloud | tee /tmp/output.txt
no_of_failures=`awk -F ":" '/failure/ {gsub(" ","");print $2}' /tmp/output.txt`
no_of_errors=`awk -F ":" '/error/ {gsub(" ","");print $2}' /tmp/output.txt`
if [ -z "$no_of_failures" ]; then
	no_of_failures=0
fi
if [ -z "$no_of_errors" ]; then
	no_of_errors=0
fi
echo "failures = $no_of_failures"
echo "errors = $no_of_errors"
exit_code=$((no_of_failures + no_of_errors))
exit $exit_code
