#### CREATE NAMESPACE ####  
kubectl create namespace pqr  

#### CREATE SERVICE ACCOUNT ####  
kubectl create sa mysa  -n pqr   
kubectl get sa -n pqr    
kubectl get sa mysa -n pqr    
kubectl describe  sa mysa -n pqr    

#### CREATE ROLE ####  
kubectl create role pod-reader --verb=get,list,watch,delete  --resource=pods,deployment -n pqr   
kubectl get role pod-reader  -n pqr    
kubectl describe  role pod-reader  -n pqr     

#### CREATE ROLE BINDING ####   
kubectl create rolebinding mybinding  --role=pod-reader --serviceaccount=pqr:mysa -n pqr   
kubectl get rolebinding mybinding -n pqr   
kubectl describe  rolebinding mybinding -n pqr    

#### VERIFICATION ####   
kubectl auth can-i list pod --as=system:serviceaccount:pqr:mysa -n pqr   
kubectl auth can-i delete  pod  --as=system:serviceaccount:pqr:mysa -n pqr   
kubectl auth can-i delete deployment   --as=system:serviceaccount:pqr:mysa -n pqr   
kubectl auth can-i list  deployment   --as=system:serviceaccount:pqr:mysa -n pqr   

