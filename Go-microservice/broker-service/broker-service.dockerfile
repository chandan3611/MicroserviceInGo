# base go image
#FROM golang:1.18-alpine as builder

#RUN mkdir /app

#COPY . /app

#WORKDIR /app

#RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api

#RUN chmod +x /app/brokerApp

## Commenting out above line because instead of building bockerApp executable everytime 
## I want to copy executable that my makefile builds to docker image

#build a tiny docker image

FROM alpine:latest

RUN mkdir /app

#COPY --from=builder /app/brokerApp /app
COPY brokerApp /app

CMD ["/app/brokerApp"]
