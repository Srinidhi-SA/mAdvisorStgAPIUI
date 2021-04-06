rsync -r * API_DOCKER/code/mAdvisor-api/ --exclude API_DOCKER --exclude copyApiFolder.sh --exclude buildspec.yml --exclude hadoop_docker --exclude NGINX_DOCKER --exclude copyHadoopImage.sh --exclude requirements
cp -r requirements API_DOCKER/requirements/
cp -r static NGINX_DOCKER/static/

