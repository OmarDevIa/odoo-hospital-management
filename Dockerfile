FROM odoo:17

USER root

RUN pip3 install --upgrade pip && \
    pip3 install wheel && \
    apt-get update && apt-get install -y \
    libldap2-dev libsasl2-dev libxml2-dev libxslt1-dev \
    libzip-dev libjpeg-dev gcc g++ python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./odoo /mnt/odoo
COPY ./enterprise /mnt/enterprise
COPY ./custom /mnt/custom

USER odoo
