$username = $args[0]
$password = $args[1]

Add-Type -AssemblyName System.DirectoryServices.AccountManagement  
$ct = [System.DirectoryServices.AccountManagement.ContextType]::Machine, $env:computername  
$opt = [System.DirectoryServices.AccountManagement.ContextOptions]::SimpleBind  
$pc = New-Object System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList $ct  
$Result = $pc.ValidateCredentials($username, $password).ToString()
$Result
