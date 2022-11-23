FROM docker.io/debian:bookworm-slim

LABEL org.opencontainers.image.authors = "Daniele Pizzolli"
LABEL org.opencontainers.image.vendor = "Dipartimento per la trasformazione digitale, Presidenza del consiglio dei Minstri della Repubblica Italiana"
LABEL org.opencontainers.image.source = "https://github.com/italia/design-scuole-wordpress-theme-devops"

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
