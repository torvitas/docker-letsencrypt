# remote letsencrypt webroot
this container can be used to regenerate certificates on a remote system

vhost1:
    image: torvitas/letsencrypt
    privileged: true
    command: 'app:run'
    environment:
        SSH_USER: "vhostsshuserforwww"
        SSH_HOST: "vhostdomain.com"
        SSH_CERT_USER: "vhostsshuserforcertificates"
        SSHFS_WEB_SOURCE_PATH: "/var/www/vhosts/vhost1"
        CERT_HOST: "vhost1.com"
        CERT_MAIL: "info@domain.com"
    volumes:
        - ./ssh:/root/.ssh
vhost2:
    image: torvitas/letsencrypt
    privileged: true
    command: 'app:run'
    environment:
        SSH_USER: "vhostsshuserforwww"
        SSH_HOST: "vhostdomain.com"
        SSH_CERT_USER: "vhostsshuserforcertificates"
        SSHFS_WEB_SOURCE_PATH: "/var/www/vhosts/vhost2"
        CERT_HOST: "vhost2.com"
        CERT_MAIL: "info@domain.com"
    volumes:
        - ./ssh:/root/.ssh
