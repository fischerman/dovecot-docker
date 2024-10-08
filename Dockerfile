FROM ubuntu:24.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      dovecot-core dovecot-imapd dovecot-lmtpd dovecot-submissiond \
      dovecot-sieve dovecot-managesieved dovecot-mysql dovecot-pgsql \
      dovecot-sqlite dovecot-antispam dovecot-ldap dovecot-solr dovecot-auth-lua \
      rsync mysql-client

RUN mkdir -p /var/vmail && \
    chown -R 1000:1000 /var/vmail/

RUN cp -r /etc/dovecot /dovecot-template
RUN rm -r /etc/dovecot/
RUN dovecot --version

EXPOSE 24 143 993 12345 10026

CMD ["dovecot", "-F"]
