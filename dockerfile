FROM devopsedu/webapp
#Update repository
RUN apt-get install dialog -y
RUN apt-get update -y

#install PHP modules
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

#Copy Application Files
RUN rm -rf /var/www/html/*
ADD projCert/website /var/www/html

#Open port 80
EXPOSE 80

#Start Apache service
#CMD echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD echo "ServerName localhost" >> /etc/apache2/conf-available/fqdn.conf
CMD a2enconf fqdn
CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]
