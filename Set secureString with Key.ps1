# This script is very useful in a security aspect.
# Lets say your AD has an automatic creation of mailboxes for new employees
# You want to make the workflow as safe as possible, to make it hard to highjack the service account used
# We first create a secure Key defined as $sKey, and then set the password ($PW).
# We then set up a workflow by storing the password keys on a secure server
# We then create an SA and give it accessrights to our folder storing the PW. 
# Third part is the script you use in the automatic creation of mailbox
# We make the SA fetch the SharedPW and AES keys, convert it to securestring and this will be used to connect to your EXO eniornment for creation


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


##Disclaimer##
# Please test scripts found online in a test setting before taking it to production
# For any questions you might have, feel free to contact me



