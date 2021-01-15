FROM golang:1.12
COPY . /src
WORKDIR /src

RUN CGO_ENABLED=0 GOOS=linux go build -mod=vendor -o gamepad-test .

FROM heroku/heroku:18
WORKDIR /app
COPY --from=0 /src/gamepad-test /app
CMD ["./gamepad-test"]