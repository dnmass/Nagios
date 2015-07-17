FROM ubuntu:14.04
MAINTAINER David Massie <david.n.massie@gmail.com>
ENV REFRESHED_AT 2015-07-14

RUN apt-get update \
        && apt-get -q -y install check-postgres perl-doc supervisor nagios-nrpe-server nagios-plugins git \
        && git clone https://github.com/dnmass/Nagios.git ./Nagios/ \
        && apt-get clean \
        && cp ./Nagios/nrpe.cfg /etc/nagios/nrpe.cfg  \
        && cp ./Nagios/check_postgres.sh /usr/lib/nagios/plugins/
        && chmod +x ./Nagios/start

EXPOSE 5666

CMD [ "./Nagios/start" ]
