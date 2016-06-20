#!/bin/bash

function runCertBot()
{
    # mount remote certificates
    sshfs ${SSHFS_CERT_SOURCE} /etc/letsencrypt
    # mount remote webroot
    sshfs ${SSHFS_WEB_SOURCE} /mnt
    # generate certificate
    certbot certonly --webroot --webroot-path /mnt ${CERT_HOST_STRING} -m ${CERT_MAIL} -n --agree-tos --expand
    cd /etc/letsencrypt/live/${CERT_HOST}/ && rm -f cacert.pem && cat privkey.pem fullchain.pem > apachecert.pem && cd /
}
