https://web.archive.org/web/20201112010739/https://coreos.com/blog/grpc-protobufs-swagger.html
https://github.com/philips/grpc-gateway-example

sudo apt-get install build-essential

git clone https://github.com/iamrajiv/helloworld-grpc-gateway.git

cd helloworld-grpc-gateway/

make install

# Temp add go path to sudo
sudo su 
export PATH=$PATH:/usr/local/go/bin

sudo chmod -R 777 /usr/local/bin

# non root user on debian will receive access denied to folder need to sudo and export go path
GO111MODULE=on GOBIN=/usr/local/bin go install github.com/bufbuild/buf/cmd/buf@v1.15.1 && \
	GO111MODULE=on GOBIN=/usr/local/bin go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2 && \
	GO111MODULE=on GOBIN=/usr/local/bin go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway && \
	GO111MODULE=on GOBIN=/usr/local/bin go install google.golang.org/protobuf/cmd/protoc-gen-go && \
	GO111MODULE=on GOBIN=/usr/local/bin go install google.golang.org/grpc/cmd/protoc-gen-go-grpc

make generate