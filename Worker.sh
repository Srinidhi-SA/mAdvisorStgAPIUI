rsync -r * WORKER_DOCKER/code/mAdvisor-api/ --exclude API_DOCKER --exclude copyApiFolder.sh --exclude buildspec.yml --exclude hadoop_docker --exclude NGINX_DOCKER --exclude copyHadoopImage.sh --exclude requirements --exclude WORKER_DOCKER --exclude Worker.sh
cp -r requirements WORKER_DOCKER/requirements/
cd WORKER_DOCKER
docker build -t $REPOSITORY_URI_WORKER:latest .
docker tag $REPOSITORY_URI_WORKER:latest $REPOSITORY_URI_WORKER:$IMAGE_TAG_WORKER
$(aws ecr get-login --region us-west-1 --no-include-email) 
docker push $REPOSITORY_URI_WORKER:$IMAGE_TAG_WORKER
cd ..