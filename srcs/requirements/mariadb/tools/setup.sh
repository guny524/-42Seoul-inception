#!/bin/bash

mysql_secure_installation << EOF

y
1234
1234
n
y
n
y
EOF

mysql << EOF
CREATE DATABASE ${DB};
CREATE USER '${USER}'@'%' IDENTIFIED BY '${USER_PWD}';
GRANT ALL PRIVILEGES ON db.* TO '${USER}'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PWD}';
EOF
