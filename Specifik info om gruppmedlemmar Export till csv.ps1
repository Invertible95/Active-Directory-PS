#Användarinfo från specifik grupp

$Group="HJ11b"

$Out="\\fssrv001\home$\viuh01\Windows\Desktop\ComputerList.csv' -Delimiter ";" -Encoding UTF8"            #Glöm inte byta namn på filen eller ändra location

Get-ADGroupMember -Identity $Group -Recursive | 

Get-ADUser -Property * | Select-Object CN, DisplayName, Department, EmailAddress | 

Export-Csv -Path $Out -Delimiter ";" -Encoding UTF8 -NoTypeInformation
