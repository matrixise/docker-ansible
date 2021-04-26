FROM python:3.9-alpine AS builder

ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_RETRY_FILES_ENABLED false

RUN apk add bash build-base libffi-dev openssl-dev rust cargo && pip install --user ansible

FROM python:3.9-alpine
COPY --from=builder /root/.local /root/.local

ENV PATH=/root/.local/bin:$PATH
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
