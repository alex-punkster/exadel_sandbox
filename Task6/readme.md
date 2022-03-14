## Exadel sandbox Task 6

Actions done:
1. Installed Jenkins in docker container, according to official documentation
   - download and run `docker:dind` image
   - created a Dockerfile with Jenkins image
   - run image from my Dockerfile as a container
2. Installed a Docker plugin, configured two agents using this plugin
   - modified `/lib/systemd/system/docker.service` by adding `ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock`
   - downloaded and run docker image from https://hub.docker.com/r/bibinwilson/jenkins-slave/
   - configured Jenkins for using this docker container as build agent
4. Run a freestyle project with bash command `date` inside, run the project on both agents
5. Created a pipeline which will execute docker ps -a in docker agent, running on Jenkins master’s Host.
6. Created a pipeline which build image from my Dockerfile and put artifact to file
