#!/bin/bash
set +x -ue -o pipefail

for i in 10_metallb 15_cert-manager 20_traefik 30_storage 50_argocd; do
    echo "Processing $i"
    kubectl kustomize --enable-helm "$i" | kubectl apply -f -
done

# missing 05_nodes
# missing 100_site
