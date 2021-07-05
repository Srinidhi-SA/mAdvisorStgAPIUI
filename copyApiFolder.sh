git clone -b Dev_api --single-branch https://Srinidhi-SA:Sri160293@github.com/Srinidhi-SA/mAdvisorDocker
mv mAdvisorDocker API_DOCKER
rsync -r * API_DOCKER/code/mAdvisor-api/ --exclude API_DOCKER --exclude copyApiFolder.sh --exclude buildspec.yml --exclude hadoop_docker --exclude NGINX_DOCKER --exclude copyHadoopImage.sh --exclude requirements
cp -r requirements API_DOCKER/requirements/
mkdir nginx
cd nginx
git clone -b Dev_nginx --single-branch https://Srinidhi-SA:Sri160293@github.com/Srinidhi-SA/mAdvisorDocker
cd ..
mkdir NGINX_DOCKER
cp -R nginx/mAdvisorDocker/* NGINX_DOCKER/
cp -r static NGINX_DOCKER/static/
cd API_DOCKER
docker build --cache-from 115502491259.dkr.ecr.us-west-1.amazonaws.com/madvisor_stg_api:build-4ca2a0a3-b717-42be-9634-239f122599b1 -t $REPOSITORY_URI_API:latest .
docker tag $REPOSITORY_URI_API:latest $REPOSITORY_URI_API:$IMAGE_TAG_API
$(aws ecr get-login --region us-west-1 --no-include-email) 
docker push $REPOSITORY_URI_API:$IMAGE_TAG_API
cd ..