
* Create token & print join command: `kubeadm token token --print-join-command`
* until pod-network is installed, nodes doesnt become ready & pods cant be scheduled.
  * Install pod-network add-ons (flannel, weave etc)
  * 

* Troubleshooting Cluster issues:[Link](https://kubernetes.io/docs/tasks/debug/debug-cluster/)

* Node stopped/notready
  * Describe node & check status.
  * Start kubelet:- `systemctl status kubelet` || `service kubelet start`
  * chek logs of kubelet : `journalctl -u kubelet.service -f`
  * check the kubelet.conf file @ `/etc/kubernetes/kubelet.conf`
  * check config file of kubelet: `/var/lib/kubelet/config.yaml`
  * 
* Backup & Restore:
  *  
