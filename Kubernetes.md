### Links
https://www.youtube.com/watch?v=X9fSMGkjtug&t=128s
https://k3s.io/
https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
https://learn.networkchuck.com/courses/raspberry-pi-projects
https://anthonynsimon.com/blog/kubernetes-cluster-raspberry-pi/
https://medium.com/karlmax-berlin/how-to-install-kubernetes-on-raspberry-pi-53b4ce300b58
https://gdha.github.io/pi-stories/pi-stories9/
https://github.com/sleighzy/raspberry-pi-k3s-homelab/blob/main/rancher-longhorn-storage.md
https://github.com/sleighzy/raspberry-pi-k3s-homelab
https://longhorn.io/docs/1.5.1/what-is-longhorn/
https://docs.k3s.io/storage
http://pidramble.com/
https://bryanbende.com/development/2021/05/07/k3s-raspberry-pi-initial-setup
https://github.com/k3s-io/k3s-ansible
https://learn.networkchuck.com/courses/take/raspberry-pi-projects/lessons/29763478-i-built-a-raspberry-pi-super-computer-ft-kubernetes-k3s-cluster-w-rancher
https://kauri.io/#collections/Build%20your%20very%20own%20self-hosting%20platform%20with%20Raspberry%20Pi%20and%20Kubernetes/(38)-install-and-configure-a-kubernetes-cluster-w/
https://rpi4cluster.com/k3s/k3s-kube-setting/

```bash
sudo nano /etc/dhcpcd.conf
```

# Enable static ip
interface eth0
static ip_address=192.168.1.241/24
static routers=192.168.1.254
static domain_name_servers=192.168.1.254

```bash
sudo nano /etc/hosts
```

# Example
192.168.1.241 p1
192.168.1.242 p2
192.168.1.243 p3
192.168.1.244 p4

```bash
sudo nano /boot/cmdline.txt
```

# Add this line to the end
cgroup_memory=1 cgroup_enable=memory

# Master setup
```bash
curl -sfL https://get.k3s.io | sh -
sudo kubectl get nodes
sudo cat /var/lib/rancher/k3s/server/node-token
```

# Worker setup
```bash
curl -sfL http://get.k3s.io | K3S_URL=https://192.168.1.241:6443 \
K3S_TOKEN=join_token_we_copied_earlier sh -
```

# Master setup nodes
```bash
sudo kubectl label nodes p2 kubernetes.io/role=worker
sudo kubectl label nodes p3 kubernetes.io/role=worker
sudo kubectl label nodes p4 kubernetes.io/role=worker
sudo kubectl get nodes
```

# Uninstall
https://docs.k3s.io/installation/uninstall
```bash
sudo /usr/local/bin/k3s-uninstall.sh
sudo /usr/local/bin/k3s-agent-uninstall.sh
```
