# Ref

[docs](https://jenkins.io/doc/book/installing/docker/#on-macos-and-linux)

# Check Jenkins directory to dockerfile

# commands - build
```bash
docker build -t jenkins-mac .
```

# run Jenkins Container on 8686
```bash
docker run \
  --name jenkins-mac \      
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8686:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
jenkins-mac
```