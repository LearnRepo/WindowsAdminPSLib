$username = $args[0]
$password = $args[1]

#$username = "test3"
#$password = "pajisingh"

if($username -ne $null -And $password -ne $null)
{
    net user /add $username $password
    write-host "User create successfully"
}
else
{
    Write-Error "username and password is needed!" > "Error.log"
}
