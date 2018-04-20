# splunk-appinspect-docker

This repository contains Dockerfile for building docker image of splunk-appinspect tool.

Use following command to build the image:
`docker build -t prabhasgupte/splunk-appinspect:latest -t prabhasgupte/splunk-appinspect:1.5.4.145 .`

Use following command to run the splunk-appinspector in container:
`docker run -v ~/path/to/my_app.tar.gz:/home/splunk_apps/target_app.tar.gz -it prabhasgupte/splunk-appinspect:latest`

Where, `my_app.tar.gz` is the Splunk app package build.
