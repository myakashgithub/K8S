##STEP1##   
kubectl create namespace pqr  
kubectl create namespace abc   
kubectl create namespace xyz

##STEP2###  
kubectl -n pqr run application1  --image=nginx --labels app=web  --expose --port 80   
kubectl -n pqr get pod,svc    

kubectl -n pqr run application2  --image=nginx --labels app=db  --expose --port 80   
kubectl -n pqr get pod,svc  

kubectl get pod -n pqr --show-labels 




kubectl -n abc run abcapp  --image=nginx --labels app=blog1  --expose --port 80   
kubectl -n abc get pod,svc 
kubectl get pod -n abc --show-labels   

kubectl -n xyz run xyzapp  --image=nginx --labels app=blog2  --expose --port 80   
kubectl -n xyz get pod,svc 
kubectl get pod -n xyz --show-labels  

##STEP3###    
kubectl -n pqr exec -it application1 -- /bin/bash  
apt-get update -y     
apt-get upgrade -y     
apt-get install wget      
wget -qO- --timeout=2 http://application1.pqr     
wget -qO- --timeout=2 http://application2.pqr    
wget -qO- --timeout=2 http://abcapp.abc  
wget -qO- --timeout=2 http://xyzapp.xyz              
exit  


kubectl -n pqr exec -it application2 -- /bin/bash
apt-get update -y     
apt-get upgrade -y     
apt-get install wget        
wget -qO- --timeout=2 http://application1.pqr      
wget -qO- --timeout=2 http://application2.pqr  
wget -qO- --timeout=2 http://abcapp.abc  
wget -qO- --timeout=2 http://xyzapp.xyz              
exit  

kubectl -n abc exec -it abcapp -- /bin/bash  
apt-get update -y     
apt-get upgrade -y     
apt-get install wget      
wget -qO- --timeout=2 http://application1.pqr   
wget -qO- --timeout=2 http://application2.pqr     
wget -qO- --timeout=2 http://abcapp.abc    
wget -qO- --timeout=2 http://xyzapp.xyz                
exit  

kubectl -n xyz exec -it xyzapp -- /bin/bash    
apt-get update -y     
apt-get upgrade -y     
apt-get install wget      
wget -qO- --timeout=2 http://application1.pqr    
wget -qO- --timeout=2 http://application2.pqr    
wget -qO- --timeout=2 http://abcapp.abc    
wget -qO- --timeout=2 http://xyzapp.xyz               
exit  
##STEP 4##   
kubectl get pod -n pqr   
kubectl get pod -n abc   
kubectl get pod -n xyz   

#####STEP5 CREATING THE NETWORK POLICY #####
kubectl create -f   deny-from-other-namespaces.yaml       
kubectl get netpol -n pqr

##### REPEAT STEP 3 ######   
Note: Notice the change
###### CLEANING UP THE ENVIRONMENT #####   
kubectl delete namespace abc pqr xyz --force
