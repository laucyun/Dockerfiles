#!/bin/bash
#
# This does the job of mysql_secure_installation via queries that works
# better in a single-process Docker environment
#

secure_installation() {
    echo "Securing installation.."
    /usr/bin/mysql_secure_installation << EOF

y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
EOF
    echo "grant all on *.* to 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
}

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    echo "MYSQL_ROOT_PASSWORD not set";
    exit 1;
fi

echo "Starting mysql to setup privileges..."
/etc/init.d/mysqld start &
MYSQL_TMP_PID=$!
echo "Sleeping for 5s"
sleep 5

# Try to connect as root without a password
mysql -u root <<-EOF
USE mysql;
EOF

if [ $? != 1 ]; then
    secure_installation
else
    echo "Error is OK, root password already set"
fi

echo "Kill temporary mysql daemon"
kill -TERM $MYSQL_TMP_PID && wait

echo "Starting mysql"
/etc/init.d/mysqld start
/bin/bash

exit 0
