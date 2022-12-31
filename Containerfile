FROM registry.redhat.io/ubi9/php-80:latest
ARG WEBTREES_VERSION

RUN \
  cd /tmp && echo "Installing webtrees version ${WEBTREES_VERSION}" && \
  curl -L https://github.com/fisharebest/webtrees/archive/refs/tags/${WEBTREES_VERSION}.tar.gz | tar -xz && \
  mv webtrees-${WEBTREES_VERSION}/* ${APP_DATA} && rmdir webtrees-${WEBTREES_VERSION} && \
  curl -Lo "${APP_DATA}/composer.json" "https://raw.githubusercontent.com/fisharebest/webtrees/${WEBTREES_VERSION}/composer.json"

RUN \
    mkdir -p ${APP_ROOT}/bin && \
    curl -o ${APP_ROOT}/bin/composer.phar "https://getcomposer.org/download/2.5.1/composer.phar" && \
    echo "f1b94fee11a5bd6a1aae5d77c8da269df27c705fcc806ebf4c8c2e6fa8645c20 ${APP_ROOT}/bin/composer.phar" | sha256sum -c - && \
    chmod +x ${APP_ROOT}/bin/composer.phar && \
    ${APP_ROOT}/bin/composer.phar install --no-dev --no-interaction --no-ansi --optimize-autoloader && \
    rm "${APP_DATA}/composer.json"

CMD /usr/libexec/s2i/run
