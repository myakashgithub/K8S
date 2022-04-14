#### CREATE NAMESPACE ####  
kubectl create namespace abc  

#### CREATE SERVICE ACCOUNT ####  
kubectl create sa mysa  -n abc   
kubectl get sa -n abc    
kubectl get sa mysa -n abc    
kubectl describe  sa mysa -n abc    

#### CREATE ROLE ####  
kubectl create role pod-reader --verb=get,list,watch,delete  --resource=pods,deployment -n abc
kubectl get role pod-reader  -n abc   
kubectl describe  role pod-reader  -n abc  

#### CREATE ROLE BINDING ####   
kubectl create rolebinding mybinding  --role=pod-reader --serviceaccount=abc:mysa -n abc   
kubectl get rolebinding mybinding -n abc   
kubectl describe  rolebinding mybinding -n abc    

#### VERIFICATION ####   
kubectl auth can-i list pod --as=system:serviceaccount:abc:mysa -n abc   
kubectl auth can-i delete  pod  --as=system:serviceaccount:abc:mysa -n abc   
kubectl auth can-i delete deployment   --as=system:serviceaccount:abc:mysa -n abc   
kubectl auth can-i list  deployment   --as=system:serviceaccount:abc:mysa -n abc   
