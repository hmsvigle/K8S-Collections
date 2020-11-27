#!/bin/sh
echo "----This setup is done on Centos VMs-----"
echo "Disable swap."
swapoff -a ; sed -i '/swap/d' /etc/fstab;
echo "Disable SELINUX."
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

echo "Disable Firewall."
systemctl disable firewalld  && systemctl stop firewalld

echo "Update sysctl setting for kubernetes networking."
cat >>/etc/sysctl.d/kubernetes.conf<<EOF 
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system
echo "Applied changes related to kubernetes networking."

echo "Install Containerd.."
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
modprobe overlay
modprobe br_netfilter

echo "Setup required sysctl params, these persist across reboots."
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

echo "Apply sysctl params without reboot"
sysctl --system

echo "Install dependent packages for containerd."
yum install -y yum-utils device-mapper-persistent-data lvm2
echo "Add Docker repository"
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
echo "Install containerd..."
yum update -y && yum install -y checkpolicy libcgroup audit-libs-python python-IPy setools-libs libsemanage-python.x86_64 libseccomp
yum install -y containerd.io

echo "Configure containerd"

mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml
systemctl restart containerd

#echo "Install docker engine:"
#yum install -y yum-utils device-mapper-persistent-data lvm2 && \
#  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
#  yum install -y docker-ce-19.03.12 && \
#  systemctl enable --now docker

echo "Add kubernetes repo to yum repository."
cat >>/etc/yum.repos.d/kubernetes.repo<<EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1 
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

echo "Install Kubernetes components: kubelet, kubeadm, kubectl"
yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
systemctl enable --now kubelet
