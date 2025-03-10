# Utilisation d'AlmaLinux 8, alternative maintenue à CentOS 7
FROM almalinux:8

# Informations sur l'image
LABEL author="Godemo2504"
LABEL project="Kubernetes"
LABEL maintainer="godemo2504@gmail.com"

# Installation des paquets nécessaires
RUN dnf install -y httpd nano git wget zip unzip curl && \
    dnf clean all

# Définition du répertoire de travail
WORKDIR /var/www/html/

# Téléchargement et installation du template
RUN curl -L -o mediplus-lite.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip && \
    unzip mediplus-lite.zip && \
    cp -rvf mediplus-lite/* . && \
    rm -rf mediplus-lite mediplus-lite.zip

# Exposition du port HTTP
EXPOSE 80

# Lancement du serveur Apache en mode foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
