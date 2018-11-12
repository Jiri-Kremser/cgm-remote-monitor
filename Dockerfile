FROM centos/nodejs-8-centos7:8
MAINTAINER Jiri Kremser

USER root
RUN mkdir -p /opt/app-root/src
USER default

ADD . /opt/app-root/src
WORKDIR /opt/app-root/src
RUN export PATH="$PATH:/opt/rh/rh-nodejs8/root/usr/bin/" && npm install && \
  npm run postinstall

USER root
RUN chown :root /etc/passwd && chmod g+w /etc/passwd
USER default

EXPOSE 1337

ENTRYPOINT ["/opt/app-root/src/entrypoint.sh"]

CMD ["node", "server.js"]
