FROM galeksandrp/travistest:docker-alpine AS base
COPY --chown=ng:ng aports /home/ng/package
WORKDIR /home/ng/package
RUN abuild-keygen -n -a
RUN abuild checksum
RUN abuild -r

FROM galeksandrp/travistest:docker-xrdp
COPY --from=base /home/ng/packages/ng/x86_64/xrdp-*.apk /root
RUN apk add --allow-untrusted /root/xrdp-*.apk
