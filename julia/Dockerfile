FROM docker.io/julia:1.9.0-rc1-bullseye

ENV ENABLE_JITPROFILING=1

WORKDIR /app

COPY main.jl .

CMD [ "julia", "main.jl" ]
