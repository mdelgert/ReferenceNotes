# Download and install SqlPackage
https://learn.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage-download?view=sql-server-ver16
https://learn.microsoft.com/en-us/dotnet/core/tools/global-tools

```ps
winget install Microsoft.DotNet.SDK.8
dotnet tool install -g microsoft.sqlpackage
```

# powershell backup example
SqlPackage.exe /Action:Export /TargetFile:"Y:\test1.bacpac" /SourceServerName:"tcp:YourServer.database.windows.net,1433" /SourceDatabaseName:"YourDatabase" /SourceUser:"YourUser" /SourcePassword:'YourPassword'

# powershell restore example
SqlPackage.exe /Action:Import /SourceFile:"Y:\test1.bacpac" /TargetServerName:"tcp:YourServer.database.windows.net,1433" /TargetDatabaseName:"YourDatabaseRestored" /TargetUser:"YourUser" /TargetPassword:'YourPassword'

# example export from Azure SQL Database using SQL authentication and a connection string
SqlPackage /Action:Export /TargetFile:"C:\AdventureWorksLT.bacpac" \
    /SourceConnectionString:"Server=tcp:{yourserver}.database.windows.net,1433;Initial Catalog=AdventureWorksLT;Persist Security Info=False;User ID=sqladmin;Password={your_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

# example export using short form parameter names, skips schema validation
SqlPackage /a:Export /ssn:"{yourserver}.database.windows.net,1433" /sdn:"AdventureWorksLT" /su:"sqladmin" \
    /sp:"{your_password}" /tf:"C:\AdventureWorksLT.bacpac" /p:VerifyExtraction=False

# example export using Microsoft Entra managed identity
SqlPackage /Action:Export /TargetFile:"C:\AdventureWorksLT.bacpac" \
    /SourceConnectionString:"Server=tcp:{yourserver}.database.windows.net,1433;Initial Catalog=AdventureWorksLT;Authentication=Active Directory Managed Identity;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

# example export connecting using Microsoft Entra username and password
SqlPackage /Action:Export /TargetFile:"C:\AdventureWorksLT.bacpac" \
    /SourceConnectionString:"Server=tcp:{yourserver}.database.windows.net,1433;Initial Catalog=AdventureWorksLT;Authentication=Active Directory Password;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;User ID={yourusername};Password={yourpassword}"

# example export connecting using Microsoft Entra universal authentication
SqlPackage /Action:Export /TargetFile:"C:\AdventureWorksLT.bacpac" /UniversalAuthentication:True \
    /SourceConnectionString:"Server=tcp:{yourserver}.database.windows.net,1433;Initial Catalog=AdventureWorksLT;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
