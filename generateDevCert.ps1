$password = $args[0]
while([string]::IsNullOrWhiteSpace($password))
{
    WRITE-HOST "Enter Password"
    $password = READ-HOST
}

dotnet dev-certs https -ep ./volumes/blazorxr/certs/blazorxr.pfx -p $password
dotnet dev-certs https --trust

"ASPNETCORE_Kestrel__Certificates__Default__Path=/https/blazorxr.pfx
ASPNETCORE_Kestrel__Certificates__Default__Password=$password" | Out-File -FilePath "./volumes/blazorxr/blazorxr_https.env"