$localgroup = $args[0]
$username = $args[1]

$localgroup
$username

if($username -ne $null -And $localgroup -ne $null)
{
    $msg = net localgroup $localgroup $username /add 2>&1;
    if($msg -like "*completed successfully*")
    {
        $msg2 = REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" 2>&1;
        if($msg2 -like "*ERROR*")
        {
            write-host $msg2
        }
        else
        {
           $tempstr = "*" + $username + "*";
            if($msg2 -like $tempstr)
            {
                write-host $msg
            }
            else
            {
              $msg3 = REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v $username /t REG_DWORD /d 0 2>&1;
               write-host $msg
            }
        }
        
    }
    else
    {
        if($msg -like "*already a member*")
        {
            $msg2 = REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" 2>&1;
            if($msg2 -like "*ERROR*")
            {
                write-host $msg2
            }
            else
            {
                $tempstr = "*" + $username + "*";
                if($msg2 -like $tempstr)
                {
                 write-host $msg
                }
                else
                {
                    $msg3 = REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v $username /t REG_DWORD /d 0 2>&1;
                    write-host $msg
                }
            }
        }
    }
}
else
{
    write-host "Error: username and password is required `n ./AddUserAssignGroup.ps1 argument1 arguments2 `n Eg: `n ./AddUserAssignGroup.ps1 localgroup1 user1"
}