# Copyright 2021 - Offen Authors <hioffen@posteo.de>
# SPDX-License-Identifier: MIT

FROM alpine:3.13

WORKDIR /root

RUN apk add --update ca-certificates docker openrc gnupg
RUN rc-update add docker boot

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc && \
  chmod +x mc && \
  mv mc /usr/bin/mc

COPY src/backup.sh src/entrypoint.sh /root/
RUN chmod +x backup.sh && mv backup.sh /usr/bin/backup \
  && chmod +x entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
