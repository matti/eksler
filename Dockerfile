FROM --platform=linux/amd64 ubuntu:20.04
ENV PROMPT_COMMAND="history -a"
ENV PATH="/root/.asdf/shims/:/asdf/bin:${PATH}"

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  git curl unzip \
  gettext-base \
  && rm -rf /var/lib/apt/lists/*

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