![logo](img/logo-black-300px.png)

[![Build Status](https://travis-ci.org/azohra/shipyard.svg?branch=master)](https://travis-ci.org/azohra/shipyard)![License](https://img.shields.io/github/license/azohra/shipyard.svg)![Issues](https://img.shields.io/github/issues/azohra/shipyard.svg)

---

# Introduction

⛵ Shipyard 

Opinionated soft multitenancy for GKE. 

At a high level, Shipyard is a namespace orchestrator. It aims to configure clusters with IAM & namespace bounded resources so that teams can safely binpack their workloads on the same compute instances. Simply write a `yml` configuration file and let Shipyard do the rest.

An example of a full `shipyard.yml` [here](https://gist.github.com/MatthewNielsen27/92b7c99e8c5b6632e977539110301def).

⛵ #SetSail 

# Installation

To install Shipyard, simply run this command:

```console
curl -s https://install.shipyard.azohra.com | sh
```

Upgrading Shipyard can be done by re-running the installation command above or by issuing the following command in our cli:

```console
shipyard --upgrade
```

Here are all the command-line flags for Shipyard (if that's your thing):

```console
Usage: shipyard [flags]

flags:
  -u, --upgrade                  upgrade shipyard to the latest version
  -v, --version                  print the current shipyard version
  -a, --auto                     do not prompt for confirmation
  -y, --yml                      path to a valid shipyard yml [file or url]
  -h, --help                     prints this message
```

# Usage

To run shipyard, simply point to your config file with the `-y` or `--yml` flag

```console
shipyard -y config.yml
```

You can even pass the URL to a remotely stored config file!

```console
shipyard -y https://www.example.com/config.yml
```

## About Configuration Files

Configuration files are used as a blueprint for your GKE cluster and are composed of various resources.

Lets take a look at a config file:

```yaml
ships:

  uss-gamble: # Complex
    users:
      - {email: justin@azohra.com,   role: admin}
      - {email: richard@azohra.com,  role: developer}
      - {email: frank@azohra.com,    role: viewer}
    helm:
      plugins:
        gcs: https://github.com/nouney/helm-gcs
      chart_repos:
        azohra: gs://azohra-charts-repo
      charts:
        - stable/grafana
        - azohra/strapped
    labels:
      istio-injection: enabled
    clusters:
      - {name: pearl-harbour, project: azohra, region: us-east1}
 
  uss-condor: # Simple
    users:
      - {email: frank@azohra.com, role: admin}
    clusters:
      - {name: pearl-harbour, project: azohra, region: us-east1}
```

The complete list of resources and their usage can be found [here](https://docs.shipyard.azohra.com/#/).

# Contributing

We are open to anyone contributing to this repo. Please ensure you follow the [code of conduct](https://github.com/azohra/shipyard/blob/master/CODE_OF_CONDUCT.md).

If you wish to contribute and don't know where to start, check out the [issues](https://github.com/azohra/shipyard/issues)
section for inspiration.

<!-- ### Using the compiler to generate new straps -->

# License

Shipyard is licensed under the [MIT](https://github.com/azohra/shipyard/blob/master/LICENSE) license.

---

Made with :heart: by Azohra