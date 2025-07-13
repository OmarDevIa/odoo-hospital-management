FROM odoo:17

# Définir l'utilisateur root pour les installations
USER root

# Installer les dépendances Python supplémentaires si besoin (ex: psycopg2-binary, pandas, etc.)
RUN pip3 install --upgrade pip && \
    pip3 install wheel && \
    apt-get update && apt-get install -y libldap2-dev libsasl2-dev libxml2-dev libxslt1-dev libzip-dev libjpeg-dev libpq-dev gcc g++ python3-dev && \
    apt-get clean

# Copier le fichier de configuration
COPY ./odoo.conf /etc/odoo/odoo.conf

# Copier le code source Odoo, les modules Enterprise et Custom
COPY ./odoo /mnt/odoo
COPY ./enterprise /mnt/enterprise
COPY ./custom /mnt/custom

# Revenir à l'utilisateur odoo
USER odoo
