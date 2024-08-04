wisecow app deployed in k8s
what i do
--------------------------------
platform used for this project : Aws ec2 ubuntu instance
docker: image is build using dockerfile and push in to dockerhub
kubernetes : I create cluster using kubeadm(manually create master node and worker node)
cicd : its done in github actions workflow
challenges i faced
--------------------------------
1) while making tls secure connection with ingress controller there is a problem faced. I used nginx-server for deployment in k8s but its not worked.but with out tls the deployment is working in k8s.
2) while doing cicd in github workflow. the build is success but in the deployment section i faced a issue of connectivity to kubernetes api server. beacause of i created manual kubernetes using kubeadm.so the api server is created on private server.
    so while deploying on github the connection is interrupted because of that.i tried to expose api server but its not a best practice.but while iam deploying manually in system the deployment is success.

