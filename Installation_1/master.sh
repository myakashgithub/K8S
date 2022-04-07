### Run the file workeer.sh first and then run the above command #####

##### Installing Kubernetes on master node #####

sudo su  

echo 1 > /proc/sys/net/ipv4/ip_forward 

exit

sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.23.0

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "Getting node information by running kubectl command"

kubectl get nodes

echo "******************Installing Calico Network Add on******************"

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

echo "******************************Running kubectl  join command******************************"
kubeadm token create --print-join-command

