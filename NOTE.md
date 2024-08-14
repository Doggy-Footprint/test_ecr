docker, jenkins
1. write docker-compose.yml
2. run docker daemon (docker application - windows / run daemon - linux)
3. run `docker-compose up -d`
4. you can visit `http://localhost:8080`
5. You can find initialAdministratorPassword in docker image.
6. install suggested Plugins (test_ecr/test_ecrpw), and Docker, Docker Pipeline
7. make Dockerfile in SpringBoot project root directory.
8. create repository in Amazon Elastic Container Registry
9. build SpringBoot project -> jar
10. create Jenkinsfile in SpringBoot project directory
11. in Jenkins, create a new Pipeline job
12. Test (commit & push changes to repo)



