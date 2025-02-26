FROM golang:1.22-alpine AS build

WORKDIR /app

COPY main.go .

ENV GO111MODULE auto

RUN go mod init main && \
    go mod tidy && \
    go build -o app

FROM alpine:3.19

WORKDIR /app

COPY --from=build /app/app .

CMD ["./app"]


