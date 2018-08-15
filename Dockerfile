FROM fedora:latest

RUN dnf upgrade --refresh -y
RUN dnf install php php-devel sqlite php-xml php-mbstring php-pdo php-pgsql zip php-zip php-json php-gd php-ldap php-twig2 php-opcache php-mysqlnd php-pecl-pq composer node npm which -y
RUN composer create-project symfony/symfony-demo
RUN cd symfony-demo
RUN bin/console doctrine:database:create
RUN ./vendor/bin/simple-phpunit