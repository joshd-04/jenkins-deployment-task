# jenkins-deployment-task
DevOps Apprenticeship: Jenkins Deployment task

1) ENV SETUP
    - install Docker
    - add jenkins + ubuntu to the docker group
    - reboot

2) SET UP REPO
    - All task 1 files + jenkinsfile

3) SETUP JOB ON JENKINS GUI
    - pipeline job

4) DESIGN + WRITE jenkinsfile
    - stages:
        1) "init" - cleanup and build things like networks/volumes etc
        2) "Build" - Build required images.
        3) "deploy" - run the containers
        4) post-actions

5) VALIDATE

STRETCH GOALS:
6) INSTALL TRIVY
    - follow guide for Trivy and run fs scan on whole workspace
    - Archive the scan results

7) INPUT
    - manually approve the scan results to continue.

8) UNIT TESTS
    - Run the supplied test
    - Error handle for failing tests (unstable build)
    - decide on how to deal with requirements + installs.
