## Exadel sandbox Task 6

Actions done:
1. Installed Jenkins in docker container, according to official documentation
2. Installed a Docker plugin, configured two agents using this plugin
3. Run a freestyle project with bash command `date` inside, run the project on both agents
4. Created a pipeline which will execute docker ps -a in docker agent, running on Jenkins master’s Host.
5. Created a pipeline which build image from my Dockerfile and put artifact to file
