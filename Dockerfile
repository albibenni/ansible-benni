FROM ubuntu:jammy AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y software-properties-common curl ansible git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS bbenni
ARG TAGS
RUN addgroup --gid 1000 benni
RUN adduser --gecos benni --uid 1000 --gid 1000 --disabled-password benni
USER benni
WORKDIR /home/benni

FROM bbenni
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS main.yml"]
