import { register } from "./prom-client";

export default async function handler(req, res) {
  const metrics = await register.metrics();
  res.setHeader("Content-Type", register.contentType);
  res.status(200).send(metrics);
}
