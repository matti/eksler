FROM --platform=linux/amd64 ubuntu:20.04
LABEL org.opencontainers.image.source https://github.com/matti/eksler

ENV PROMPT_COMMAND="history -a"
ENV PATH="/root/.asdf/shims/:/asdf/bin:${PATH}"

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  git curl unzip \
  gettext-base \
  && apt-get clean

RUN curl -Lsf -o /usr/local/bin/ec2-instance-selector "https://github.com/aws/amazon-ec2-instance-selector/releases/download/v2.3.0/ec2-instance-selector-linux-amd64" \
  && chmod +x /usr/local/bin/ec2-instance-selector

RUN curl -Lsf -o /usr/local/bin/helmer https://raw.githubusercontent.com/matti/helmer/1ee2b71075024238de801f28a30e06467e56a71b/helmer \
  && chmod +x /usr/local/bin/helmer

RUN git clone https://github.com/asdf-vm/asdf.git /asdf --branch v0.9.0 \
  && rm -rf /asdf/.git

WORKDIR /app

COPY .tool-versions .

RUN asdf plugin add eksctl
RUN asdf plugin add kubectl
RUN asdf plugin add jq
RUN asdf plugin add helm
RUN asdf plugin add awscli
RUN asdf install

COPY . .
ENTRYPOINT [ "bin/eksler" ]