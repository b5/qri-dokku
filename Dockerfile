FROM golang:1.14

#Install git
RUN apt-get update &&\
  apt-get install -y git
RUN git clone --branch v0.9.11 https://github.com/qri-io/qri.git
RUN cd qri && go install
RUN qri setup -a

#Set working directory
WORKDIR /go/qri
EXPOSE 2503 4001
CMD ["qri","connect"]
