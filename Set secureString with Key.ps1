
# EXO = Exchange Online
# SA = Service Account

# Create secure file
$keyFile = "Enter path where you want to store keyFile (AES.txt)"
$sKey = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($sKey)
$sKey | Out-File $keyFile

# Create storage point and define password
$pwFile = "Enter path where you want to password file (SharedPW.txt)"
$sKey = Get-Content $keyFile
$PW = "OoRbyXJNuRi48A1Bg^Cm&y&OlfXwutUh" | ConvertTo-SecureString -AsPlainText -Force
$PW | ConvertFrom-SecureString -Key $skey | Out-File $pwFile 

# Below part is the strings you use in the scripts that require the use of a secure password
# For example if you need a Service Account perform an automatic task in ExchangeOnline,
# this makes it so the SA account use the secure password string to connect to EXO
$User = "Specify user that will use the PW" # Often some form of Service Account
$pwFile = "Enter path to fetch (SharedPW.txt)"
$keyFile = "Enter path to fetch (AES.txt)"
$sKey = Get-Content $keyFile
$EXOCredentials = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $User, (Get-Content $pwFile | ConvertTo-SecureString -Key $sKey)

Connect-ExchangeOnline -Credential $EXOCredentials






