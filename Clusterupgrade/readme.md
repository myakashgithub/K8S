
#### STEP 1: ####  
Drain the master node (kubeadm drain <master node> --ignore-daemonsets) AND kubectl get nodes   

#### STEP 2: ####  
kubeadm version   
apt-mark unhold kubeadm  AND apt-get update -y AND apt-get install -y kubeadm=1.XX.0-00      
kubeadm version    

#### STEP 3: ####  
kubeadm upgrade plan   
kubeadm upgrade apply v1.XX.00   

#### STEP4: ####     
apt-mark unhold kubelet kubectl    
apt-get install -y kubelet=1.XX.0-00   
apt-get install -y kubectl=1.XX.0-00   
kubelet --version   
kubectl version   
apt-mark hold kubelet kubectl   
apt-mark showhold   

#### STEP 5: ####     
systemctl restart kubelet   
systemctl is-active kubelet   
systemctl is-enabled kubelet   
systemclt daemon-reload   
#### STEP 6:  ####     
kubectl get nodes   
kubectl uncordon <master nodee>   
kubectl get nodes   
