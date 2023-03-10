




$keyFile = "\\appsrv062\d$\ARSConfig\Security\AES.txt"
$sKey = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($sKey)
$sKey | Out-File $keyFile


$pwFile = "\\appsrv062\d$\ARSConfig\Security\SharedPW.txt"
$keyFile = "\\appsrv062\d$\ARSConfig\Security\AES.txt"
$sKey = Get-Content $keyFile
$PW = "OoRbyXJNuRi48A1Bg^Cm&y&OlfXwutUh" | ConvertTo-SecureString -AsPlainText -Force
$PW | ConvertFrom-SecureString -Key $skey | Out-File $pwFile 

$User = "FBG_SA_ARS_EXO@falkenbergskommun.onmicrosoft.com"
$pwFile = "\\appsrv062\d$\ARSConfig\Security\SharedPW.txt"
$keyFile = "\\appsrv062\d$\ARSConfig\Security\AES.txt"
$sKey = Get-Content $keyFile
$ExoCredentials = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $User, (Get-Content $pwFile | ConvertTo-SecureString -Key $sKey)

Connect-ExchangeOnline -Credential $ExoCredentials


