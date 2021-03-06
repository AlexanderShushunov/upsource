Upsource image
=============
https://www.jetbrains.com/upsource/help/2.0/install_on_linux.html - describes the installation steps.

Brings the Upsource repository browser and code review tool to Ubuntu.
(a fork of gmetal/upsource)

To use it: 

`docker pull ashushunov/upsource`

or build image from Dockerfile

`sudo docker build --tag ashushunov/upsource --rm .`

The Upsource version is **2.0.3462**. It is installed in /usr/local/upsource.

Folder to Upsource data is `/opt/upsource_data` will be created automatically.

Run a container

```
sudo docker run \
-d \
--restart=always \
-p 8080:8080 \
--name upsource \
-v /opt/upsource_data/conf:/usr/local/upsource/conf \
-v /opt/upsource_data/data:/usr/local/upsource/data \
-v /opt/upsource_data/logs:/usr/local/upsource/logs \
-v /opt/upsource_data/backups:/usr/local/upsource/backups \
ashushunov/upsource /usr/local/upsource/bin/start-and-go-to-inf-loop.sh
```
