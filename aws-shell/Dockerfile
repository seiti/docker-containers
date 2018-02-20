FROM alpine:latest
RUN mkdir -p /aws && \
    apk -Uuv add groff less python py-pip && \
    pip install aws-shell && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

WORKDIR /aws
ENTRYPOINT ["aws-shell"]
