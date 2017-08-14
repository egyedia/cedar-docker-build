#!/bin/bash

echo "Current working directory:"
pwd

FILE_NAME=cedar-${CEDAR_SERVER_NAME}-server-application

echo "Downloading microservice jar:"
mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:copy -Dartifact=org.metadatacenter:${FILE_NAME}:${CEDAR_VERSION}:jar -DoutputDirectory=. -Dmdep.useBaseVersion=true -Dmdep.stripVersion=true
echo "Renaming microservice jar:"
mv ./${FILE_NAME}.jar ./cedar-server.jar
echo "Contents of current directory:"
ls -ls

echo "Extracting configuration file:"
jar xf cedar-server.jar config.yml
echo "Contents of current directory:"
ls -ls
