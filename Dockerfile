FROM docker.io/debian:bookworm-slim

# Metadata params
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION

LABEL org.opencontainers.image.authors="Daniele Pizzolli"
LABEL org.opencontainers.image.vendor="Dipartimento per la trasformazione digitale, Presidenza del consiglio dei Minstri della Repubblica Italiana"
LABEL org.opencontainers.image.source="https://github.com/italia/design-scuole-wordpress-theme-devops"
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.source="${VCS_URL}"
LABEL org.opencontainers.image.revision="${VCS_REF}"

ENV DEVOPS_CONTAINER_RUNNING="true"

COPY bin/aio-test-install-debian /usr/local/bin
RUN /usr/local/bin/aio-test-install-debian

COPY bin/aio-test-install-base /usr/local/bin
RUN /usr/local/bin/aio-test-install-base

COPY bin/aio-test-run /usr/local/bin

RUN groupadd -r pa && useradd --no-log-init --create-home --system --gid pa pa

RUN mkdir /report.d  && chown pa:pa /report.d

WORKDIR /home/pa

VOLUME /report.d

USER pa

ENTRYPOINT ["/usr/local/bin/aio-test-run"]

CMD ["http://localhost:8080"]
