FROM ubuntu:latest

LABEL maintainer="Prabhas Gupte <prabhas.gupte@gmail.com>"
LABEL "splunk-appinspect-version"="2.0.1"
ENV AppInspectVersion=2.0.1
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y python-pip
RUN pip install --upgrade pip setuptools
RUN apt-get install -y libxml2-dev libxslt-dev lib32z1-dev python-lxml
RUN mkdir -p /home/downloads
RUN mkdir -p /home/splunk_apps
COPY splunk-appinspect-${AppInspectVersion}.tar.gz /home/downloads/splunk-appinspect-${AppInspectVersion}.tar.gz
RUN pip install /home/downloads/splunk-appinspect-${AppInspectVersion}.tar.gz
COPY run_splunk_appinspect.sh /home/run_splunk_appinspect.sh
# ENTRYPOINT splunk-appinspect inspect /home/splunk_apps/target_app.tar.gz --mode precert --included-tags splunk_appinspect --included-tags cloud
ENTRYPOINT /home/run_splunk_appinspect.sh
