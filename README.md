# Description
## An image which can be used in bitbucket pipeline or any other pipeline which supports linux based docker images. It is based off alpine with few run time and utility packages like .net core,ant,node/npm, grunt curl, Chrome and firefox web drivers for selenium web automation needs
# Components
* It gets alpine as base image (a lightweight distribution of linux)  [alpine with dotnet core sdk 2.2](https://github.com/dotnet/dotnet-docker/blob/master/samples/dotnetapp/Dockerfile.alpine-x64)
* install bash (for scripting)
* jdk (to use ant library for salesforce deployment)
* jq (to parse json response in cli). [JSON processor](https://stedolan.github.io/jq/)
* nodejs/npm (node runtime and package manager) [node](https://nodejs.org)
* grunt-cli  (cli for grunt task runner) [gruntjs](https://gruntjs.com/)
* checking dotnet version (our image is based off a dotnet core image from microsoft so it comes pre-installed)
* chromium and chromium-chromedriver and firefox and geckodriver (to use it in selenium web automation project) [selenium](https://www.seleniumhq.org/)
* apache-ant (to deploy metadata to salesforce) [ant](https://ant.apache.org/)
* curl (genral pupose sommnad line tool to transfer data eith URLS i.e. to make a POST using HTTP) [curl](https://curl.haxx.se/)
* and some other misc utility/supporting packages like xvfb, tar

## How you can test it locally if at-least the image builds without any errors:
> following steps are tested on Mac only
### Install docker on your machine if it is not installed.
### Once installed let's test if docker works fine on your machine. To check, open your terminal and run following command
```
docker --version
```
### and you should see its version, like this
*Docker version 18.09.2, build 6247962*
### After installing we need to start docker application before moving forward. You can do this by Docker GUI or by starting it from cli. Following command is tested in Mac only:
```
open --background -a Docker
```
It will take a while to docker to start and be ready to take further commands
### Now goto root of project folder and run following where ./Dockerfile is a path to the file which will be the definition of your image. *sfappdockv1* is the name of the image.
```
docker build . -t sfappdockv1 -f ./Dockerfile
```
> You might wanna make sure the Entrypoint in DockerFile is pointed to bash i.e. **ENTRYPOINT ["/bin/bash"]** to use bash so that you can interact with it using command line
```
docker run -it sfappdockv1
```
> -it allow you to run docker in interactive mode
### To detach the current Docker interactive mode without exiting the shell,
> use the escape sequence **Ctrl-p** + **Ctrl-q**
