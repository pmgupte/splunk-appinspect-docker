FROM ubuntu:latest

LABEL maintainer="Prabhas Gupte <prabhas.gupte@gmail.com>"
LABEL "splunk-appinspect-version"="1.5.4.145"
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y python-pip
RUN pip install --upgrade pip setuptools
RUN apt-get install -y libxml2-dev libxslt-dev lib32z1-dev python-lxml
RUN mkdir -p /home/downloads
RUN mkdir -p /home/splunk_apps
COPY splunk-appinspect-1.5.4.145.tar.gz /home/downloads/splunk-appinspect-1.5.4.145.tar.gz
RUN pip install /home/downloads/splunk-appinspect-1.5.4.145.tar.gz
ENTRYPOINT splunk-appinspect inspect /home/splunk_apps/target_app.tar.gz --mode precert --included-tags splunk_appinspect --included-tags cloud
