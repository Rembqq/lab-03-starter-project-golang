FROM golang:1.22

WORKDIR /fizzbuzz

COPY go.mod .
COPY go.sum .


COPY cmd ./cmd
COPY lib ./lib
COPY templates ./templates
COPY main.go .

RUN go build -o ./fizzbuzz

CMD ["./fizzbuzz", "serve"]
