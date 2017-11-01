Shameless copy of https://github.com/sameersbn/docker-squid


To run an authenticated squid proxy:

```bash
  docker run --name squid -d  \ 
  --publish 3128:3128 \
  --volume /path/to/squid/passwd:/etc/squid3/passwd \
  --volume /path/to/squid/squid.conf:/etc/squid3/squid.conf \
  --volume /srv/docker/squid/cache:/var/spool/squid3 \
  seiti/squid
```

The user and password in `passwd` file is *seiti*.
To create your own passwd file use  `htpasswd`, provided, in Ubuntu, by the `apache2-utils` package.

