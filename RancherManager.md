https://ranchermanager.docs.rancher.com/pages-for-subheaders/rancher-on-a-single-node-with-docker
https://vmguru.com/2021/04/how-to-install-rancher-on-k3s/
https://helm.sh/docs/intro/install/



docker run -d --restart=unless-stopped \
  --name ranchermanager \
  -p 80:80 -p 443:443 \
  --privileged \
  rancher/rancher:latest \
  --no-cacerts
