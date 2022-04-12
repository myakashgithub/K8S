##STEP 1##   
kubectl create namespace abc     
kubectl create namespace xyz    
kubectl create namespace pqr    
kubectl get namespace    

#STEP 2#   
kubectl -n pqr run web --image=nginx --labels app=web --expose --port 80    
kubectl get pods -n pqr   
kubectl get svc -n pqr   
kubectl get all -n pqr    
kubectl get pods -n pqr --show-labels    


#STEP 3#    
kubectl -n abc run pod1 --rm -i -t --image=alpine -- /bin/sh   
wget -qO- --timeout=2 http://web.pqr   
exit   
 
#STEP 4#   
kubectl -n xyz run pod2 --rm -i -t --image=alpine -- /bin/sh   
wget -qO- --timeout=2 http://web.pqr    
exit   

#STEP 5#   
kubectl -n pqr run pod3 --rm -i -t --image=alpine -- /bin/sh   
wget -qO- --timeout=2 http://web.pqr   
exit      

#STEP 6#   
kubectl create -f  web-deny-all.yaml   
kubectl get netpol -n pqr   

#STEP 8#   
Repeat step 3, step 4 , step 5 to verify that you can connect to the pod   


#########################CLEANUP############################  

kubectl delete -f web-deny-all.yaml     
kubectl delete namespace abc xyz pqr --force  
