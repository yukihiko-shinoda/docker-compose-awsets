FROM golang:1.20.2-bullseye
# hadolint ignore=DL3003
RUN git clone --branch v1.1.1 https://github.com/trek10inc/awsets.git \
 && cd awsets/cmd/awsets \
 && go build && go install
# For compatiblity with Visual Studio Code
RUN mkdir /workspace
WORKDIR /workspace
ENTRYPOINT [ "awsets", "list", "--output", "output/resources.json" ]
