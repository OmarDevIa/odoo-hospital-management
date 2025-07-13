FROM odoo:17

# Copier le fichier de configuration
COPY ./odoo.conf /etc/odoo/odoo.conf

# Copier les sources Odoo et les modules
COPY ./odoo /mnt/odoo
COPY ./enterprise /mnt/enterprise
COPY ./custom /mnt/custom
