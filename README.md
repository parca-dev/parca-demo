# parca-demo

This parca-demo repository contains a minikube virtual machine that runs Kubernetes with Parca and the agent.
You can choose to deploy demo applications in various languages to that cluster to checkout each languages' support.

## Lanaguages

Compiled languages such as C/C++, Rust and Go are currently supported. (There are some requirements though, binaries should be compiled with [frame pointers](https://en.wikipedia.org/wiki/Call_stack#Stack_and_frame_pointers) and [debug symbols](https://en.wikipedia.org/wiki/Debug_symbol). There are planned improvements for loosening these requirements.`**`)

We're actively working on improving support for other languages.
Here is a list of issues where we track the progress:

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

Once minikube is up and running you can deploy Parca and monitoring stack:
```
./deploy-infra.sh
```

After that you can deploy the demo applications by running:
```
./deploy-demo.sh
```

Note: This will take some time to pull down base images and build each language's demo.

At the end you should have a demo for each language in the cluster.

## Usage

Access Parca by port-forwarding to it by running: `kubectl port-forward -n parca svc/parca 7070`.
Open http://localhost:7070/

Once you selected the profile type you want to see (currently only CPU Samples) you can query for languages by using these selectors:
```

namespace="parca", pod=~"go-.*"
namespace="parca", pod=~"rust-.*"
namespace="parca", pod=~"python-.*"
namespace="parca", pod=~"nodejs-.*"
namespace="parca", pod=~"java-.*"
```

## `**`

- [Extended stack unwinding support.](https://github.com/parca-dev/parca-agent/issues/293)
- Debuginfod support for finding debug symbols.
