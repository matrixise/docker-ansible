FROM debian:stable-slim

ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_RETRY_FILES_ENABLED false

RUN apt update && apt install -y python3 python3-pip openssh-client sshpass && pip3 install --upgrade pip && pip3 install ansible

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "entrypoint.sh"]
