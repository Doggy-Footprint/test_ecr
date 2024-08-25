# Setup


## Write and Run Jenkins Server


### Plugins


Install Suggested Plugins


### Admin User
Username: test_ecr
Password: test_ecrpw


### Pipeline
Pipeline > Definition : Pipeline script from SCM


SCM: Git
Repositories > Repository URL : https://github.com/<username>/<repo_name>
Branches to build > Branch Specifier : */master


Script Path : Jenkinsfile


## Run Docker engine


Run Docker daemon

### Run docker

```
gradle clean build
docker build -t test_ecr .
docker run -d -p 8081:8080 -it test_ecr
```

## Push & run Jenkins

### Error

docker: Error response from daemon: Mounts denied: path ...

Docker가 Mount에 사용하는 폴더를 벗어난 문제.
Docker Desktop > Setting > Resources > files sharing에서 에러 path를 추가해주면 된다.
