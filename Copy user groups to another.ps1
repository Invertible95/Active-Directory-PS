
$CopyFrom = Read-host -Prompt "Enter user to copy from"
$CopyTo = Read-host -Prompt "Enter user to copy to"

Get-ADUser -Identity $CopyFrom -Properties memberof | Select-Object -ExpandProperty memberof |  Add-ADGroupMember -Members $CopyTo
