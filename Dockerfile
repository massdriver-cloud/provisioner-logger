ARG FLUENT_BIT_VERSION=4.0.0

FROM fluent/fluent-bit:${FLUENT_BIT_VERSION}

COPY fluent-bit.conf /fluent-bit/etc/fluent-bit.conf
COPY parsers.conf /fluent-bit/etc/parsers.conf
COPY enrich.lua /fluent-bit/etc/enrich.lua

ENV MASSDRIVER_AUTH_HEADER=unset
ENV LOG_HOST=api.massdriver.cloud
ENV LOG_URI=/logs

ENTRYPOINT ["/fluent-bit/bin/fluent-bit"]
CMD ["-c", "/fluent-bit/etc/fluent-bit.conf"]