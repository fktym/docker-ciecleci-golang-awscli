FROM circleci/golang:1.13.8

USER root
RUN apt-get install python3.7
RUN ln -sf /usr/bin/python3.7 /usr/bin/python
RUN apt-get install python-pip python3-pip
RUN pip install awscli awsebcli
RUN go get -u golang.org/x/lint/golint \
  && go get -u github.com/gobuffalo/packr/v2/packr2 \
  && go get -u golang.org/x/tools/cmd/goimports

USER circleci
