FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o shhhh main.go

FROM scratch
COPY --from=builder /app/shhhh /shhhh
ENTRYPOINT ["/shhhh"]
