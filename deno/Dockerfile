FROM docker.io/denoland/deno:alpine-1.28.3

WORKDIR /app

COPY . .

RUN deno cache main.ts

USER 1000:1000

CMD ["run", "--v8-flags=--perf-basic-prof", "main.ts"]
