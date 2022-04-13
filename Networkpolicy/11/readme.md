	
kubectl create namespace pqr   

kubectl -n pqr run  web --image=nginx --labels app=web --expose --port 80   
kubectl -n pqr run  db --image=nginx --labels app=db --expose --port 80   
kubectl -n pqr run  app  --image=nginx --labels app=app --expose --port 80   

kubectl -n pqr exec -it web -- /bin/bash   
apt-get update -y  
apt-get upgrade -y   
apt-get install  wget -y   
wget -qO-  -T 2   -t  2       http://web.pqr   
wget -qO-  -T 2   -t  2       http://db.pqr 
wget -qO-  -T 2   -t  2       http://app.pqr   
exit  


kubectl -n pqr exec -it db -- /bin/bash    
apt-get update -y   
apt-get upgrade -y   
apt-get install  wget -y   
wget -qO-  -T 2   -t  2       http://web.pqr   
wget -qO-  -T 2   -t  2       http://db.pqr 
wget -qO-  -T 2   -t  2       http://app.pqr   
exit  


kubectl -n pqr exec -it app -- /bin/bash   
apt-get update -y   
apt-get upgrade -y   
apt-install wget -y   
wget -qO-  -T 2   -t  2       http://web.pqr   
wget -qO-  -T 2   -t  2       http://db.pqr 
wget -qO-  -T 2   -t  2       http://app.pqr   
exit  
