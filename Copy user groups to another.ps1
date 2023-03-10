# This can be used to copy security groups from one user to another
# Useful if you need to copy for example accessrights from an employee to a new 


$CopyFrom = Read-host -Prompt "Enter user to copy from"
$CopyTo = Read-host -Prompt "Enter user to copy to"

Get-ADUser -Identity $CopyFrom -Properties memberof | Select-Object -ExpandProperty memberof |  Add-ADGroupMember -Members $CopyTo
