
#### STEP1 ####   	   
kubectl create namespace pqr   
kubectl create namespace abc

####STEP2            	
kubectl -n pqr run pqrapp1 --image=nginx --labels app=front --expose --port 80   
kubectl -n pqr run  pqrapp2 --image=nginx --labels app=back  --expose --port 80   
kubectl -n abc run  abcapp  --image=nginx --labels app=web --expose --port 80   

####STEP3####   	
kubectl -n pqr exec -it pqrapp1 -- /bin/bash   
apt-get update -y  
apt-get upgrade -y   
apt-get install  wget -y   
wget -qO-  -T 2   -t  2       http://pqrapp1.pqr   
wget -qO-  -T 2   -t  2       http://pqrapp2.pqr    
wget -qO-  -T 2   -t  2       http://abcapp.abc      
exit  


kubectl -n pqr exec -it pqrapp2 -- /bin/bash    
apt-get update -y   
apt-get upgrade -y   
apt-get install  wget -y   
wget -qO-  -T 2   -t  2       http://pqrapp1.pqr   
wget -qO-  -T 2   -t  2       http://pqrapp2.pqr    
wget -qO-  -T 2   -t  2       http://abcapp.abc      
exit  


kubectl -n abc exec -it abcapp -- /bin/bash   
apt-get update -y   
apt-get upgrade -y   
apt-get install  wget -y   
wget -qO-  -T 2   -t  2       http://pqrapp1.pqr   
wget -qO-  -T 2   -t  2       http://pqrapp2.pqr    
wget -qO-  -T 2   -t  2       http://abcapp.abc      
exit  

####STEP4 CREATE NETWORK POLICY ####   	
kubectl create -f default-deny-all-egress.yaml
kubectl get netpol -n pqr
kubectl describe netpol -n pqr

####NOTE: Repeat ****STEP3*****     

####CLEAN UP     
kubectl delete namespace pqr abc --force


