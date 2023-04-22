# DotNetCore
Install DotNetCore SDK https://docs.microsoft.com/en-us/dotnet/core/install/

Generate and Trust Dev SSL Cert
https://docs.microsoft.com/en-us/dotnet/core/additional-tools/self-signed-certificates-guide#create-a-self-signed-certificate

Firefox fix: https://docs.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-5.0&tabs=visual-studio#configure-trust-of-https-certificate-using-firefox-browser

Install cert
```
dotnet dev-certs https --clean
dotnet dev-certs https --trust
```

Create new project with individual auth and sql/localdb
```
dotnet new webapp --auth Individual --use-local-db true --output <project> --framework net5.0
dotnet new sln -o <solution>
dotnet sln <solution> add <project>
```

## Library Manager (LibMan)
https://docs.microsoft.com/en-us/aspnet/core/client-side/libman/

Install LibMan
```
dotnet tool uninstall --global Microsoft.Web.LibraryManager.Cli
dotnet tool install --global Microsoft.Web.LibraryManager.Cli
```

Initialize using CDN
```
libman init --default-provider cdnjs
```

Add library, find library name from https://cdnjs.com/
```
libman install twitter-bootstrap -d wwwroot/lib/twitter-bootstrap
```

## Entity Framework
https://docs.microsoft.com/en-us/ef/core/

Install Entity Framework
```
dotnet tool uninstall --global dotnet-ef
dotnet tool install --global dotnet-ef
```

Add EF packages
```
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
```

Apply EF migrations
```
dotnet ef migrations add <migration>
```

Remove existing database
```
dotnet ef database drop --force
```

Update database
```
dotnet ef database update
```
