

function Find_Userinfo {
    $Users = Import-Csv -Path '\\Fssrv001\home$\viuh01\windows\desktop\Skola - Manager Samaccountname.csv'
    foreach ($User in $Users) {
        $SAMUser = $User.Samaccountname
        Get-ADUser -Filter $SAMUser -Properties * | Select @{name = 'ManagerName'; expression = { (Get-ADUser -Identity $_.manager | Select-Object -ExpandProperty name) } }
    }
    
}

Find_Userinfo