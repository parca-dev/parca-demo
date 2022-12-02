FROM docker.io/node:17-alpine

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN ["npm", "clean-install"]

COPY . .
RUN ["npm", "run", "build"]

ENV NODE_OPTIONS='--perf-basic-prof'

CMD ["npm", "start"]
