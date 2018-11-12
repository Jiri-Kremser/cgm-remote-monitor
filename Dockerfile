FROM centos/nodejs-8-centos7:8
MAINTAINER Jiri Kremser


RUN mkdir -p /opt/app
ADD . /opt/app
WORKDIR /opt/app

RUN npm install && \
  npm run postinstall && \
  npm run env && \
  chown :root /etc/passwd && chmod g+w /etc/passwd

EXPOSE 1337

ENTRYPOINT ["/opt/app/entrypoint"]

CMD ["node", "server.js"]
