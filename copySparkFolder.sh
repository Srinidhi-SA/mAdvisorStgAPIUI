#! /bin/sh
cd Spark/
rm -r mAdvisorStgSpark
git clone -b main --single-branch https://Srinidhi-SA:Sri160293@github.com/Srinidhi-SA/mAdvisorStgSpark
cd mAdvisorStgSpark
sh apiCode.sh
cd SPARK_DOCKER
docker build -t $REPOSITORY_URI_SPARK:latest .
docker tag $REPOSITORY_URI_SPARK:latest $REPOSITORY_URI_SPARK:$IMAGE_TAG_SPARK
$(aws ecr get-login --region us-west-1 --no-include-email) 
docker push $REPOSITORY_URI_SPARK:$IMAGE_TAG_SPARK
cd ../../..