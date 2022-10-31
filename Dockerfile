FROM golang:alpine3.16 as builder

LABEL maintainer "Rafael Andrade <rafael.io@outlook.com>"

COPY ./src/main.go .
RUN go build -o /dist/app main.go

# imagem explicitamente vazia, especialmente para criar imagens "do zero"
FROM scratch

LABEL maintainer "Rafael Andrade <rafael.io@outlook.com>"

COPY --from=builder /dist /dist

CMD ["/dist/app"]