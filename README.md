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

## Results (17 November 2026)

| Required check | Pull request | Gate result | Merge state |
|---|---|---|---|
| `naive-gate` | #1, failing test | skipped | mergeable (`UNSTABLE`) |
| `ci-ok` | #1, failing test | failure | blocked |
| `ci-ok` + `docs-check` | #2, README only, all tests pass | `docs-check` never reported | blocked |
| `ci-ok` (final setting) | #2 | success | mergeable |

Runs: [#1](https://github.com/infracraftlabs/ci-gate-demo/actions/runs/44041555616),
[#2](https://github.com/infracraftlabs/ci-gate-demo/actions/runs/44041697319).
The ruleset now requires only `ci-ok`. The pull requests stay open as evidence and won't be merged.
Not tested here: a merge queue (`merge_group`), organisation-level rulesets, external CI.
