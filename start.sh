#!/bin/bash
set -e

IP=`hostname --ip-address`

FIRSTRUN=/firstrun
if [ ! -f $FIRSTRUN ]; then
    cp -f /etc/opscenter/opscenterd.conf /etc/opscenter/opscenterd.conf.org
    touch $FIRSTRUN
else 
    cp -f /etc/opscenter/opscenterd.conf.org /etc/opscenter/opscenterd.conf
fi

sed -i -e "s/^interface.*/interface = $IP/" /etc/opscenter/opscenterd.conf

if [ "$AUTH" = "True" ]; then
    sed -i -e "s/^enabled = False/enabled = $AUTH/" /etc/opscenter/opscenterd.conf
fi

echo "=> Starting OpsCenter on $IP..."

# Executing opscenterd
exec /usr/share/opscenter/bin/opscenter -f