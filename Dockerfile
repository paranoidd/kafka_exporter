FROM    golang:1.14-buster as builder
RUN     mkdir -p /tmp/build
WORKDIR /tmp/build
COPY    . ./
RUN     go build

FROM       debian:buster-slim
COPY       --from=builder /tmp/build/kafka_exporter /bin/kafka_exporter
EXPOSE     9308
ENTRYPOINT [ "/bin/kafka_exporter" ]
