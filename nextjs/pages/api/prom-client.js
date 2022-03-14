import promClient from "prom-client";

export const register = new promClient.Registry();

promClient.collectDefaultMetrics({
  app: "parce-demo-nextjs",
  prefix: "parca_demo_nextjs_",
  timeout: 10000,
  gcDurationBuckets: [0.001, 0.01, 0.1, 1, 2, 5],
  register,
});

export default promClient;
