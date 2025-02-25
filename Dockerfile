FROM almalinux:8

LABEL author="Godemo2504"
LABEL project="Kubernetes"
LABEL maintainer="godemo2504@gmail.com"

# Installation des paquets nécessaires
RUN dnf install -y httpd nano git wget zip unzip curl && \
    dnf clean all

WORKDIR /var/www/html/

# Téléchargement et installation du template
RUN curl -L -o neogym.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip && \
    unzip neogym.zip && \
    cp -rvf neogym/* ./ && \
    rm -rf neogym neogym.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
