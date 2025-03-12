# Develop locally using the Azure Cosmos DB emulator
https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-develop-emulator?tabs=docker-windows%2Ccsharp&pivots=api-nosql

docker pull mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator:latest

docker run \
    --publish 8081:8081 \
    --publish 10250-10255:10250-10255 \
    --name linux-emulator \
    --detach \
    mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator:latest

https://localhost:8081/_explorer/index.html

    curl --insecure https://localhost:8081/_explorer/emulator.pem > ~/emulatorcert.crt

# Does not work easier to download and install cert in root trusted
$parameters = @{
    Uri = 'https://localhost:8081/_explorer/emulator.pem'
    Method = 'GET'
    OutFile = 'emulatorcert.crt'
    SkipCertificateCheck = $True
}
Invoke-WebRequest @parameters