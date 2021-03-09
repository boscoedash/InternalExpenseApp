$path = $PSScriptRoot

while ((Split-Path -Path $path -Leaf) -ne '.github')
{
    $path = Split-Path -Path $path -Parent
}

$root = Split-Path -Path $path -Parent

write-host $path