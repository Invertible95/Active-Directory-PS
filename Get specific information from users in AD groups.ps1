# This script gets specific information for users member of a specific AD group
# Attributes after Select-Object are examples and can be changed to your liking
# The script also exports the information to a .csv file.
# If you don't want the file exported you can put a # before the last pipe

$Out = "Enter path for storing Awesometest.csv"
$ADGroup = "Enter name of AD group"

Get-ADGroupMember -Identity $ADGroup -Recursive | 

Get-ADUser -Property * | Select-Object Name, Department, Office, Title, EmailAddress |

Export-Csv -Path $Out -Delimiter ";" -Encoding UTF8 
