Upsource image
=============

Brings the Upsource repository browser and code review
tool to Ubuntu using the phusion/baseimage image.
(a fork of gmetal/upsource)

To use it: 

`docker pull ashushunov/upsource`

or build image from Dockerfile

`sudo docker build --tag ashushunov/upsource --rm=true .`

The Upsource version is **1.0.12566**. It is installed in /usr/local/upsource.

Make folders to Upsource data.
```
sudo mkdir -p \
/opt/upsource_data/conf \
/opt/upsource_data/data \
/opt/upsource_data/logs \
/opt/upsource_data/backups
```
Run container
```
sudo docker run \
-d \
--restart=always \
-p 8080:8080 \
-v /opt/upsource_data/conf:/usr/local/upsource/conf \
-v /opt/upsource_data/data:/usr/local/upsource/data \
-v /opt/upsource_data/logs:/usr/local/upsource/logs \
-v /opt/upsource_data/backups:/usr/local/upsource/backups \
ashushunov/upsource /usr/local/upsource/bin/startme.sh`
```
