# This can be used to copy security groups from one user to another
# Useful if you need to copy for example accessrights from an employee to a new 

function CopyADGroups {
    $CopyFrom = Read-host -Prompt "Enter user to copy from"
    $CopyTo = Read-host -Prompt "Enter user to copy to"
    
    Get-ADUser -Identity $CopyFrom -Properties memberof | Select-Object -ExpandProperty memberof |  Add-ADGroupMember -Members $CopyTo
}



##Disclaimer##
# Please test scripts found online in a test setting before taking it to production
# For any questions you might have, feel free to contact me
