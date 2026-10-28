
FROM golang:1.22 AS build

WORKDIR /app

COPY . .

ENV CGO_ENABLED=0
RUN go build -o quelpoke .

FROM alpine

RUN adduser -D -u 1000 appuser

COPY --from=build /app/quelpoke /quelpoke

USER 1000

EXPOSE 8080

ENV VERSION=1.0.0

CMD ["/quelpoke"]