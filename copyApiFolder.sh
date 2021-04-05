rsync -r * API_DOCKER/code/mAdvisor-api/ --exclude API_DOCKER --exclude copyApiFolder.sh --exclude buildspec.yml --exclude hadoop_docker --exclude NGINX_DOCKER --exclude copyHadoopImage.sh --exclude requirements
cp -r requirements API_DOCKER/requirements/
cp -r static NGINX_DOCKER/static/
cd API_DOCKER
COMMIT_HASH=$(echo $CODEBUILD_RESOLVED_SOURCE_VERSION | cut -c 1-7)
IMAGE_TAG=build-$(echo $CODEBUILD_BUILD_ID | awk -F":" '{print $2}')
docker build -t api .
docker tag api:latest 115502491259.dkr.ecr.us-west-1.amazonaws.com/madvisor_stg_api:$IMAGE_TAG
$(aws ecr get-login --region us-west-1 --no-include-email) 
docker push 115502491259.dkr.ecr.us-west-1.amazonaws.com/madvisor_stg_api:$IMAGE_TAG
cd ..
