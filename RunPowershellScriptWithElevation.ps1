$Admin = ".\shasan"
$AdminPass = "pajisingh"
$secstr = New-Object -TypeName System.Security.SecureString
$AdminPass.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $Admin, $secstr



#Start-Process powershell -verb runas -ArgumentList "-file  C:\Apache24\docs\admin\Components\CreateUser.ps1"

#Start-Process powershell -Credential $cred -ArgumentList "-noexit", "-file  C:\Apache24\docs\admin\Components\CreateUser.ps1" 

$PathTemp = $args[0];
$PModule = $PathTemp.split("\")
$length = $args.length - 1;
$Arguments = "";


for($i = 0; $i -lt $length ; $i = $i + 1)
{
 $Arguments = $Arguments + " " + "`""+$args[$i+1] + "`"";
}

if($PModule.length -gt 1)
{
    $UserScriptCaller = ("-file  " + $PathTemp + $Arguments).toString()
    
    # for exit mode uncomment below line make sure no exit mode is commented
    Start-Process powershell -verb runas -ArgumentList $UserScriptCaller
    
    # for no exit mode uncomment below line make sure exit mode is commented
    # for non hidden mode uncomment below line make sure hidden mode is commented
    #Start-Process powershell -verb runas -ArgumentList "-noexit", $UserScriptCaller
    
    # for hidden mode uncomment below line make sure non hidden mode is commented
    # Start-Process powershell -verb runas -ArgumentList "-noexit", $UserScriptCaller 
    
}
else
{
    $Path = @(Get-Location)[0].toString()
    $UserScriptCaller = ("-file  " + $Path + "\" + $PModule[$PModule.length - 1]  + $Arguments).toString();
    Start-Process powershell -verb runas -ArgumentList "-noexit", $UserScriptCaller
}