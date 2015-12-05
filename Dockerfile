FROM kanboard/kanboard:stable
MAINTAINER Radek 'blufor' Slavicinsky <radek@blufor.cz>

ENV MAIL_FROM 'kanboard@domain.com'
ENV SMTP_HOST 'smtp.private'
ENV SMTP_PORT '25'
ENV GITLAB_OAUTH_ID 'YOUR_APPLICATION_CLIENT_ID'
ENV GITLAB_OAUTH_SECRET 'YOUR_OAUTH_SECRET'
ENV GITLAB_OAUTH_ENDPOINT 'http://git.private'

RUN export DEBIAN_FRONTEND=noninteractive && apt-get -q update && apt-get -qqy install php5-pgsql && apt-get clean
ADD run.sh /run.sh

CMD /run.sh
