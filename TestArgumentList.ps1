$length = $args.length

for($i = 0; $i -lt $length; $i = $i+1)
{
    write-host "Argument number " + $i + "  is " + $args[$i];
}