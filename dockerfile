FROM ubuntu:14.04
MAINTAINER David Massie <david.n.massie@gmail.com>
ENV REFRESHED_AT 2015-07-14

RUN apt-get update \
        && apt-get -q -y install check-postgres perl-doc supervisor nagios-nrpe-server nagios-plugins git python-pip build-essential python-dev \
        && pip install pymongo
        && git clone https://github.com/dnmass/Nagios.git ./Nagios/ \
        && cp ./Nagios/nrpe.cfg /etc/nagios/nrpe.cfg  \
        && cp ./Nagios/check_postgres /usr/lib/nagios/plugins/ \
	&& cp ./Nagios/check_mongodb.py /usr/lib/nagios/plugins/ \
	&& chmod +x /usr/lib/nagios/plugins/* \
        && chmod +x ./Nagios/start

EXPOSE 5667

CMD [ "./Nagios/start" ]
