Upsource image
=============

Brings the Upsource repository browser and code review
tool to Ubuntu using the phusion/baseimage image.

To use it: docker pull ashushunov/upsource

The Upsource version is **1.0.12566**. It is installed
in /usr/local/upsource.

sudo mkdir -p \
/opt/upsource_data/conf \
/opt/upsource_data/data \
/opt/upsource_data/logs \
/opt/upsource_data/backups


sudo docker run \
-d \
--restart=always \
-p 8081:8081 \
-v /opt/upsource_data/conf:/usr/local/upsource/conf \
-v /opt/upsource_data/data:/usr/local/upsource/data \
-v /opt/upsource_data/logs:/usr/local/upsource/logs \
-v /opt/upsource_data/backups:/usr/local/upsource/backups \
ashushunov/upsource /usr/local/upsource/bin/upsource.sh start