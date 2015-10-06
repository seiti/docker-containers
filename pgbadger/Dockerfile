# pgbadger (PostgreSQL log Analyzer) is written in Perl
FROM perl
MAINTAINER Seiti Yamashiro <seiti@seiti.eti.br>

# Install pgbadger and JSON::XS
ENV PGBADGER_VERSION 7.1
ENV PGBADGER_URL https://github.com/dalibo/pgbadger/archive/v${PGBADGER_VERSION}.tar.gz
RUN curl -L ${PGBADGER_URL} | tar -C /opt -xzf - \
    && cd /opt/pgbadger-${PGBADGER_VERSION} \
    && perl Makefile.PL \
    && make install \
    && cpanm JSON::XS
ENTRYPOINT ["/usr/local/bin/pgbadger", "--prefix", "%t:%r:%u@%d:[%p]:"]
