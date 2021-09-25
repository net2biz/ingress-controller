# removing the old certificates and secrets before creating the new one
rm  tls.*
kubectl delete secret example-com-tls

# generating a selft sign certificate for example.com expiring in 365 days
openssl req -x509 -newkey rsa:4096 -sha256 -nodes  -keyout tls.key -out tls.crt  -subj "/CN=example.com" -days 365
 

# creating a secret of type tls 
kubectl create secret tls example-com-tls --cert=tls.crt  --key=tls.key 

