taka3shcloud:
  postgres_user.present:
    - password: {{ salt['grains.get_or_set_hash']('owncloud:dbpass') }}
    - db_user: postgres
    - db_password: {{ salt['pillar.get']('db:adminpass') }}
    - db_host: db

owncloud:
  postgres_database.present:
    - encoding: UTF8
    - owner: taka3shcloud
    - template: template0
    - db_user: postgres
    - db_password: {{ salt['pillar.get']('db:adminpass') }}
    - db_host: db

/var/www/html/owncloud/config/autoconfig.php:
  file.managed:
    - source: salt://owncloud/autoconfig.php
    - user: www-data
    - group: www-data
    - mode: 600
    - template: jinja
