##STEP 1##\
kubectl create namespace abc \
kubectl create namespace xyz \
kubectl create namespace pqr \
kubectl get namepsace

#STEP 2# \
kubectl -n pqr run web --image=nginx --labels app=web --expose --port 80 \
kubectl get pods -n pqr \
kubectl get svc -n pqr \
kubectl get all -n pqr  \
kubectl get pods -n pqr --show-labels 


#STEP 3# \
(a)kubectl -n abc run pod1 --rm -i -t --image=alpine -- /bin/sh \
(b)wget -qO- --timeout=2 http://web.pqr \
(c)exit
 
#STEP 4# \
(a)kubectl -n xyz run pod2 --rm -i -t --image=alpine -- /bin/sh \
(b)wget -qO- --timeout=2 http://web.pqr \
(c)exit

#STEP 5# \
(a)kubectl -n pqr run pod3 --rm -i -t --image=alpine -- /bin/sh \
(b)wget -qO- --timeout=2 http://web.pqr \
(c)exit   

#STEP 6# <br/>
kubectl create -f  allow_all_traffic.yaml <br/>
kubectl get netpol -n pqr 

#STEP 8#\ 
Repeat step 3, step 4 , step 5


#########################CLEANUP############################

kubectl delete -f allow_all_traffic.yaml  <br/>
kubectl delete namespace abc xyz pqr --force
