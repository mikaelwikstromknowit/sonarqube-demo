#!/bin/bash

curl -u $SONAR_TOKEN: "$SONAR_HOST_URL/api/issues/search?componentKeys=$SONAR_PROJ_KEY&ps=500" | tee /tmp/result.json

#. sonarqube-rest.source | jq
#. sonarqube-rest.source | jq | grep rule | sort |uniq -c | sort -g
echo ""
echo "-- severity / count --"
cat /tmp/result.json | jq '.issues[].severity' | sort | uniq -c
echo "==="


echo "-- MINOR only --"
cat /tmp/result.json | jq '.issues[] | select(.severity == "MINOR")' | jq -c '{rule: .rule, severity: .severity}' | sort | uniq -c | sort -gr
#cat /tmp/result.json | jq '.issues[] | select(.severity == "MINOR")' | jq -c '{rule: .rule, severity: .severity, message: .message}' | sort | uniq -c | sort -gr
echo "==="

echo "-- all by count --"
cat /tmp/result.json | jq '.issues[]' | jq -c "{rule: .rule, severity: .severity}" | sort | uniq -c | sort -gr
echo "==="

