FROM golang:1.22 AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .

COPY cmd ./cmd
COPY lib ./lib
COPY main.go .

RUN CGO_ENABLED=0 go build -o ./fizzbuzz

FROM scratch

COPY --from=builder /app/fizzbuzz /fizzbuzz
COPY templates /templates

CMD ["/fizzbuzz", "serve"]
