# Nagios
Nagios and NRPE config files for use with Docker
sudo docker build  -t nrpe-plugins .
sudo docker run -d  -p 5667:5667 nrpe-plugins
