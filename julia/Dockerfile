FROM docker.io/julia:1.8.3-bullseye

ENV ENABLE_JITPROFILING=1

WORKDIR /app

COPY main.jl .

CMD [ "julia", "main.jl" ]
