

curl -u $SONAR_TOKEN: "$SONAR_HOST_URL/api/issues/search?componentKeys=$SONAR_PROJ_KEY&ps=500" | jq > /tmp/sq.json

