alias k=kubectl
alias m=minikube
clear

# clearing the old deployments 
kubectl delete pod nginx  
kubectl delete service nginx
kubectl delete ingress nginxctl

# running the nginx image
kubectl run nginx --image=nginx
kubectl get pods

# exposing the pod as service
kubectl expose pod nginx  --port=80 --type=NodePort
kubectl get service

./self_sign_cert.sh

# creating ingress 
kubectl create -f ingress.yaml

