FROM python:3.11-alpine AS builder

WORKDIR /app

COPY . .

FROM gcr.io/distroless/python3

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD ["-m", "http.server", "3000"]
