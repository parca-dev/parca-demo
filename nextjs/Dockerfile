FROM node:17-alpine

WORKDIR /usr/src/app
COPY . .

RUN ["npm", "install"]

RUN ["npm", "run", "build"]

ENV NODE_OPTIONS='--perf-basic-prof'

CMD ["npm", "start"]
