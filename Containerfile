FROM registry.redhat.io/ubi8/php-74@sha256:3c1a3bf573cf07a969eb6c514e38fdbba51a9ff2205e958ea8f9f23a41316d85
ARG WEBTREES_VERSION

RUN \
  cd /tmp && echo "Installing webtrees version ${WEBTREES_VERSION}" && \
  curl -L https://github.com/fisharebest/webtrees/archive/refs/tags/${WEBTREES_VERSION}.tar.gz | tar -xz && \
  mv webtrees-${WEBTREES_VERSION}/* ${APP_DATA} && rmdir webtrees-${WEBTREES_VERSION}

USER 0
RUN dnf upgrade -y --security && dnf install -y php-pecl-zip && dnf clean all
USER 1001

CMD /usr/libexec/s2i/run
