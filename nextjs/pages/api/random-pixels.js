import seedrandom from "seedrandom";
import promClient, { register } from "./prom-client";

const httpRequestTimer = new promClient.Histogram({
  name: "nextjs_random_api_response_time",
  help: "NextJS Random API Response time",
  registers: [register],
});

export default function handler(req, res) {
  const endTimer = httpRequestTimer.startTimer();
  try {
    const { seed, limit } = req.query;
    let results = [];
    const rnd = seedrandom(seed);
    for (let i = 0; i < limit; i++) {
      results = [...results, rnd()];
      //results.push(rnd());
    }
    res.status(200).json({ results });
  } finally {
    endTimer({});
  }
}
