# splunk-appinspect-docker

Use following command to run the splunk-appinspector in container:
`docker run -v ~/path/to/my_app.tar.gz:/home/splunk_apps/target_app.tar.gz -it prabhasgupte/splunk-appinspect:latest`

Where, `my_app.tar.gz` is the Splunk app package build.
