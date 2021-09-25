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

# updating the host file with ip address of the minikube
echo "$(minikube ip) example.com" | sudo tee -a /etc/hosts

# wait for 3 seconds for background processes to sync up
sleep 3

# creating self signed certs
./self_sign_cert.sh

# creating ingress 
kubectl create -f ingress.yaml

# wait for 3 seconds for background processes to sync up
sleep 3

# testing the SSL certificate. Below command should return the nginx webpage 
curl -k https://example.com

# testing the SSL certificate. Below command should return the nginx webpage 
curl --cacert tls.crt https://example.com




