FROM docker.io/node:20-alpine

WORKDIR /usr/src/app
COPY . .

WORKDIR /usr/src/app/packages/app/server
RUN yarn && yarn build

WORKDIR /usr/src/app

CMD ["node", "--perf-basic-prof", "--interpreted-frames-native-stack", "/usr/src/app/packages/app/server/dist/index.js"]
