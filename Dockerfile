FROM centos:7  # Remplace CentOS 7 par une alternative maintenue

LABEL author="Godemo2504"
LABEL project="Kubernetes"
LABEL maintainer="godemo2504@gmail.com"

# Installation des packages en une seule couche pour optimiser l'image
RUN yum install -y httpd zip unzip curl && \
    yum clean all

# Téléchargement et décompression du template
WORKDIR /var/www/html/
RUN curl -L -o photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Exposition du port HTTP
EXPOSE 80 443

# Lancement du serveur Apache en mode foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
