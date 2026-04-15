FROM postgres:16

# Installation des dépendances Python pour Patroni
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Installation de Patroni et du driver etcd
RUN pip3 install --break-system-packages patroni[etcd] psycopg2-binary

# Création du répertoire de données avec les bons droits
RUN mkdir -p /var/lib/postgresql/data && chown postgres:postgres /var/lib/postgresql/data

USER postgres
# Commande par défaut : lancer Patroni avec le fichier de config
CMD ["patroni", "/etc/patroni.yml"]