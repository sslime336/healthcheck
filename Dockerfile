FROM golang:alpine as builder

WORKDIR /app
COPY . .

RUN go env -w GO111MODULE=on \
    && go env -w GOPROXY=https://goproxy.cn,direct \
    && go env -w CGO_ENABLED=0 \
    && go env \
    && go mod download \
    && go build -o healthcheck.exe main.go

FROM alpine

WORKDIR /app

COPY --from=builder /app ./

EXPOSE 8080
CMD ["./healthcheck.exe"]
