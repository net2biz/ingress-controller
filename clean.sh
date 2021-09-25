alias k=kubectl
alias m=minkube
rm tls.key
rm tls.crt
kubectl delete --all services
kubectl delete --all deployments
kubectl delete --all pods
kubectl delete --all ingress
clear

