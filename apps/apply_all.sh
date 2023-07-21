#!/bin/bash
set +x -ue -o pipefail

argocd repo get --refresh hard git@github.com:REDACTED/kasil-apps.git

for i in $(find . -name argocd.yaml); do
    app_name="$(echo $i | cut -d'/' -f 2)" 
    echo "Processing APP $app_name"
    kubectl apply -f $i
    argocd app sync --prune $app_name
done
