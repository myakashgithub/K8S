
kubectl create namespace pqr  
kubectl create namespace abc   

kubectl -n pqr run application1  --image=nginx --labels app=api  --expose --port 80   
kubectl -n pqr get pod,svc    

kubectl -n pqr run application2  --image=nginx --labels app=guestbook  --expose --port 80   
kubectl -n pqr get pod,svc   




kubectl -n abc run abcapp  --image=nginx --labels app=blog  --expose --port 80   
kubectl -n abc get pod,svc    


kubectl -n pqr exec -it application1 -- /bin/bash   
curl http://application2.pqr   
exit  


kubectl -n pqr exec -it application2 -- /bin/bash   
curl http://application1.pqr   
exit  


kubectl -n abc exec -it abcapp -- /bin/bash   
curl http://application2.pqr    
curl http://application1.pqr   
curl http://abcapp.abc    
exit   

kubectl get pod -n pqr   
kubectl get pod -n abc   

