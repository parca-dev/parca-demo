# parca-demo

This parca-demo repository contains a minikube virtual machine that runs Kubernetes with Parca and the agent.
You can choose to deploy demo applications in various languages to that cluster to checkout each languages' support.

## Lanaguages

Go is currently fully supported and other languages work better or worse.
Here is a list of issues where we track the progress:

* Rust
* [Python](https://github.com/parca-dev/parca-agent/issues/2)
* [Java/JVM](https://github.com/parca-dev/parca-agent/issues/1)
* [Ruby](https://github.com/parca-dev/parca-agent/issues/3)
* [Elixir/Erlang](https://github.com/parca-dev/parca-agent/issues/145)
* [.NET](https://github.com/parca-dev/parca-agent/issues/161)

[Create an issue](https://github.com/parca-dev/parca-agent/issues/new/choose) to discuss support for yet another language!

## Contributions

Contributions are welcome!  
If you're missing a language you're interested in, please just add a directory with a Dockerfile and deployment.yaml.

## Installation

You need to install [minikube](https://minikube.sigs.k8s.io/docs/start/) and some virtual machine hypervisor (virtualbox is our default choice).

Check out the `start.sh` and see if there is any parameter like CPUs and memory you want to tweak for running the virutal machine.

If you're happy with the parameters, start the VM by running:
```
./start.sh
```

Once minikube is up and running you can deploy Parca and the demos by running:
```
./deploy.sh
```

Note: This will take some time to pull down base images and build each language's demo.

At the end you should have a demo for each language in the cluster.

Access Parca by port-forwarding to it by running: `kubectl port-forward -n parca svc/parca 7070`.
Open http://localhost:7070/
