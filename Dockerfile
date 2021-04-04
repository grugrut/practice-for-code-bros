FROM golang:1.13 as build
WORKDIR /go/src/github.com/grugrut/practice-for-code-bros
COPY go.mod .
COPY main.go .

RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -o /go/bin/practice-for-code-bros

FROM scratch
COPY --from=build /go/bin/practice-for-code-bros /go/bin/practice-for-code-bros
ENTRYPOINT ["/go/bin/practice-for-code-bros"]
