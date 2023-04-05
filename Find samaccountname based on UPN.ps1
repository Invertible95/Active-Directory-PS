$CSV = '\\fssrv001\home$\viuh01\Windows\Desktop\Skola - mnager.csv'


Get-Content -Path $CSV | %{ Get-ADUser -Filter {EmailAddress -eq $_} } | Select samaccountname | Export-Csv -Path "\\Fssrv001\home$\viuh01\windows\desktop\Skola - Manager Samaccountname.csv"


#@{name = 'ManagerName'; expression = { (Get-ADUser -Identity $_.manager | Select-Object -ExpandProperty name) } }