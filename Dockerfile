FROM ubuntu:focal
ARG TAGS
WORKDIR /usr/local/bin
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt update && apt install -y curl git ansible build-essential apt-transport-https
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS main.yml"]
