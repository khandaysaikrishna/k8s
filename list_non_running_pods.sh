#!/usr/bin/env bash
# List pods across all namespaces that are not in the Running state.

set -euo pipefail

kubectl get pods --all-namespaces \
  --field-selector=status.phase!=Running \
  -o=custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name,STATUS:.status.phase |
  column -t
