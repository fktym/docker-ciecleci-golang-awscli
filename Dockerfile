FROM circleci/golang:1.14.4

USER root
RUN apt-get install python3.7
RUN ln -sf /usr/bin/python3.7 /usr/bin/python
RUN apt-get install python-pip python3-pip
RUN pip install awscli awsebcli
RUN go get -u golang.org/x/lint/golint \
  && go get -u github.com/gobuffalo/packr/v2/packr2 \
  && go get -u golang.org/x/tools/cmd/goimports
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.23.8


USER circleci
