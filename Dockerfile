FROM registry.access.redhat.com/ubi8/ubi-minimal

ENV APP_DIR=/opt/sonarr

WORKDIR ${APP_DIR}

RUN microdnf update -y &&\
	microdnf install tar gzip libicu -y &&\
        curl https://download.mono-project.com/repo/centos8-stable.repo | tee /etc/yum.repos.d/mono-centos8-stable.repo &&\
	microdnf install -y mono-complete &&\
	rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm &&\
	rpm -ivh https://vault.centos.org/centos/8/PowerTools/x86_64/os/Packages/tinyxml2-6.0.0-3.el8.x86_64.rpm &&\
	microdnf install -y libmediainfo &&\
	curl -o sonarr.tar.gz -sL "https://services.sonarr.tv/v1/download/main/latest?version=4&os=linux" &&\
	tar xvf sonarr.tar.gz --strip-components=1 && rm sonarr.tar.gz &&\
        mkdir /config &&\
	chmod +x ./Sonarr.exe &&\
	chgrp -R 0 ${APP_DIR} /config &&\
	chmod -R g=u ${APP_DIR} /config &&\
	microdnf clean all

USER 1000

VOLUME /config

EXPOSE 8989

ENTRYPOINT ["mono", "--debug", "./Sonarr.exe", "-nobrowser", "-data=/config"]
