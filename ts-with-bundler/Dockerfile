FROM docker.io/node:20-alpine

WORKDIR /usr/src/app
COPY . .

RUN cd packages/app/server && yarn && yarn build

CMD ["node", "--perf-basic-prof", "--interpreted-frames-native-stack", "/usr/src/app/packages/app/server/dist/index.js"]
