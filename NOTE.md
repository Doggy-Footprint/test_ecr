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


## Push & run Jenkins

