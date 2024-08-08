docker, jenkins, AWS logon
1. write docker-compose.yml
2. run docker daemon (docker application - windows / run daemon - linux)
3. run `docker-compose up -d`
4. you can visit `http://localhost:8080`
5. You can find initialAdministratorPassword in docker image.
6. install suggested Plugins (test_ecr/test_ecrpw)
7. make Dockerfile in SpringBoot project root directory.
8. create repository in Amazon Elastic Container Registry
9. install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
10. add credential with `aws configure`
11. authenticate docker to ECR: `aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin your-account-id.dkr.ecr.your-region.amazonaws.com`, your-account-id can be checked in security management in AWS, your-region is server location such as us-east-1
12. build SpringBoot project -> jar
13. create Jenkinsfile in SpringBoot project directory
14. in Jenkins, create a new Pipeline job
15. 



