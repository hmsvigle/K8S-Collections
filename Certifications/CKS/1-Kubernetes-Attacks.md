

Available Domains - wwww.vote.com www.result.com
 1.1 ping wwww.vote.com & ping www.result.com -->  IP 
 1.2 port-scan.sh 21 IP --> Identify the opened port  ==> Docker is running
 1.3 most probably platform is containerized 
 1.4 lists containers - docker -H IP ps 
 1.5 Deploy a previledged container there to gain access to platform
 1.6 Download a script & run to escape from container to host
 1.7 in worker node, get access & run scripts to patch 
 1.8 Lists containers & finds out kubernetes container. a Dashboard running on a port 
 1.9 Find the IP for the worker node --> List Ip tables ==> sudo iptables -L -t nat | grep -i kubernetes-dashboard --> Port
 1.10 IP:Port --> Open Kubernetes Dashboard --> Get cluster information
 1.11 Find the DB server 
 1.12 identifies the DB Password --> 
 1.13 exec into the DB pod 
 1.14 Update votes table to change the status
  
