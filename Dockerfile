FROM odoo:17

# Utiliser root pour installer les dépendances
USER root

# Installer les dépendances système et Python
RUN pip3 install --upgrade pip && \
    pip3 install wheel && \
    apt-get update && apt-get install -y \
    libldap2-dev libsasl2-dev libxml2-dev libxslt1-dev \
    libzip-dev libjpeg-dev libpq-dev gcc g++ python3-dev && \
    apt-get clean

# Copier le fichier de configuration
COPY ./odoo.conf /etc/odoo/odoo.conf

# Copier les dossiers de code source
COPY ./odoo /mnt/odoo
COPY ./enterprise /mnt/enterprise
COPY ./custom /mnt/custom

# Revenir à l'utilisateur odoo
USER odoo
