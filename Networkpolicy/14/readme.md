#### STEP1 ####     
kubectl create namespace pqr  
kubectl create namespace abc   

####  STEP2  ####      
kubectl -n pqr run application1  --image=nginx --labels app=api  --expose --port 80   
kubectl -n pqr get pod,svc    

kubectl -n pqr run application2  --image=nginx --labels app=guestbook  --expose --port 80   
kubectl -n pqr get pod,svc   

kubectl -n abc run abcapp  --image=nginx --labels app=blog  --expose --port 80   
kubectl -n abc get pod,svc    

#### STEP3 ####    

kubectl -n pqr exec -it application1 -- /bin/bash   
apt-get update -y   
apt-get upgrade -y    
apt-get install wget  
wget -qO- -T 2   -t  2       http://application1.pqr    
wget -qO- -T 2   -t  2       http://application2.pqr      
wget -qO- -T 2   -t  2       http://abcapp.abc          
exit  


kubectl -n pqr exec -it application2 -- /bin/bash   
apt-get update -y    
apt-get upgrade -y    
apt-get install wget     
wget -qO- -T 2   -t  2       http://application1.pqr    
wget -qO- -T 2   -t  2       http://application2.pqr     
wget -qO- -T 2   -t  2       http://abcapp.abc         
exit  

 
kubectl -n abc exec -it abcapp -- /bin/bash    
apt-get update -y   
apt-get upgrade -y    
apt-get install wget   
wget -qO- -T 2   -t  2       http://application1.pqr   
wget -qO- -T 2   -t  2       http://application2.pqr     
wget -qO- -T 2   -t  2       http://abcapp.abc         
exit   


#### CREATE POLICY TO DENY ALL ####    
kubectl create -f default-deny-all.yaml
kubectl get netpol -n pqr



#### CLEAN UP ####  

kubectl delete namespace pqr abc --force   

