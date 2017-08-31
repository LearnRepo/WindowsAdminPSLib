$localgroup = $args[0]
$username = $args[1]

if($username -ne $null -And $localgroup -ne $null)
{
    $msg = net localgroup $localgroup $username /add 2>&1;
    write-host $msg
}
else
{
    write-host "Error: username and password is required `n ./AddUserAssignGroup.ps1 argument1 arguments2 `n Eg: `n ./AddUserAssignGroup.ps1 localgroup1 user1"
}