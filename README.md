# ci-gate-demo

A small, public experiment for the InfraCraft Labs tutorial
["Make CI a real gate with one stable required check"](https://infracraftlabs.com/insights/one-stable-required-check/).

It answers three questions on real GitHub runs:

1. If branch protection requires a gate job that only lists `needs`, and a test fails, can the
   pull request still merge? (`naive-gate`)
2. Does a gate that runs with `always()` and checks every needed job's result block it? (`ci-ok`)
3. What happens when a required check lives in a workflow that path filters skip? (`docs-check`)

`scripts/test.sh` fails when a file named `FAIL` exists, so a pull request can fail on purpose.
Nothing here deploys anything or uses secrets. Actions are pinned to commit SHAs.

The results, with links to the runs and pull requests, are in the tutorial.

This line changes only the README.
