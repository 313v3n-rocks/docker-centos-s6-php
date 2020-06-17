FROM 313v3nrocks/centos-s6:0.0.3

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/remi-php74.repo && \
    yum update -q -y && \
    yum install -y php php-fpm php-gd php-mysql php-mbstring php-pecl-zip php-intl php-xml php-posix && \
    yum clean all && rm -rf /var/cache/yum && \
    groupadd www-data && \
    useradd -M -n -s /bin/false -G www-data www-data && \
    mkdir -m 660 -p /var/run/php-fpm/ /var/log/php-fpm/ && \
    chown -R www-data:www-data /var/run/php-fpm/ /var/log/php-fpm/ /var/lib/php/ && \
    curl -sLo /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer

COPY root /
