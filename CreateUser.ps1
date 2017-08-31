$username = $args[0]
$password = $args[1]

#$username = "test3"
#$password = "pajisingh"

if($username -ne $null -And $password -ne $null)
{
    $msg = net user /add $username $password 2>&1;
    write-host $msg;
}
else
{
    Write-host "username and password is needed!"
}
