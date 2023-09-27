https://ranchermanager.docs.rancher.com/pages-for-subheaders/rancher-on-a-single-node-with-docker

docker run -d --restart=unless-stopped \
  -p 8080:80 -p 1443:443 \
  --privileged \
  rancher/rancher:latest