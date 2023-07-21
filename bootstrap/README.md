# Bootstrap of kasil cluster


## How to apply

```bash
# Metal lb need to run few times
kubectl kustomize --enable-helm 10_metallb | kubectl apply -f -

kubectl kustomize --enable-helm 15_cert-manager | kubectl apply -f -


kubectl kustomize --enable-helm 20_traefik | kubectl apply -f -
kubectl kustomize --enable-helm 100_site | kubectl apply -f -


kubectl kustomize --enable-helm 50_argocd | kubectl apply -f -
```


## How to get argocd admin password

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

Note admin is disable after install. To replace the REDACTED password use:
```
argocd account update-password --account <new-username> --new-password <new-password>
```

## Change volume to available (to reattach again)

```bash
kubectl patch pv -n democratic-csi test-pv-volume -p '{"spec":{"claimRef": null}}'
```

# PENDING

https://argocd-operator.readthedocs.io/en/latest/reference/argocd/
```
kubectl taint nodes kube0 namespace=mysql:NoExecute
```