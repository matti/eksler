FROM --platform=linux/amd64 ubuntu:20.04
LABEL org.opencontainers.image.source https://github.com/matti/eksler

ENV PROMPT_COMMAND="history -a"
ENV PATH="/root/.asdf/shims/:/asdf/bin:${PATH}"

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  git curl unzip \
  gettext-base \
  && apt-get clean

RUN git clone https://github.com/asdf-vm/asdf.git /asdf --branch v0.9.0 \
  && rm -rf /asdf/.git

WORKDIR /app

COPY .tool-versions .
RUN asdf plugin add eksctl
RUN asdf plugin add kubectl
RUN asdf plugin add helm
RUN asdf plugin add awscli
RUN asdf install

RUN curl -Lsf -o /usr/local/bin/ec2-instance-selector "https://github.com/aws/amazon-ec2-instance-selector/releases/download/v2.3.3/ec2-instance-selector-linux-amd64" \
  && chmod +x /usr/local/bin/ec2-instance-selector

RUN curl -Lsf -o /usr/local/bin/helmer https://raw.githubusercontent.com/matti/helmer/f824ee073265906a3d0cba0cd8bffae45047e522/helmer \
  && chmod +x /usr/local/bin/helmer

RUN curl -Lsf -o /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
  && chmod +x /usr/local/bin/jq

RUN mkdir /ghjk && cd /ghjk \
  && curl -Lfso yq_linux_amd64.tar.gz https://github.com/mikefarah/yq/releases/download/v4.16.2/yq_linux_amd64.tar.gz \
  && tar -xvof yq_linux_amd64.tar.gz \
  && mv yq_linux_amd64 /usr/bin/yq \
  && rm -rf /ghjk

RUN ln -s /app/bin/eksler /usr/local/bin/eksler
COPY . .
ENTRYPOINT [ "bin/eksler" ]