FROM golang:1.19-alpine

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -o app && chmod +x app

ENTRYPOINT ["./app"]
