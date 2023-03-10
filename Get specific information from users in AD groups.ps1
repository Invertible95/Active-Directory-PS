#Specific users from securitygroups

$Out = "Enter path for storing Awesometest.csv"

Get-ADGroupMember -Identity "Enter name of AD Group" -Recursive | 

Get-ADUser -Property * | Select-Object Name, Department, Office, Title, EmailAddress |

Export-Csv -Path $Out -Delimiter ";" -Encoding UTF8 
