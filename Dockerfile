FROM 313v3nrocks/centos-s6:latest

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/remi-php71.repo && \
    yum update -q && \
    yum install -y php php-fpm php-gd php-mysql php-mbstring && \
    yum clean all && rm -rf /var/cache/yum && \
    groupadd www-data && \
    useradd -M -n -s /bin/false -G www-data www-data && \
    curl -sLo /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer

COPY root /
