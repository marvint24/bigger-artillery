function Test-Administrator  
{  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}

if(-not(Test-Administrator)){
  Start-Process powershell -Verb runAs -ArgumentList '-ExecutionPolicy','Bypass', '-Command', "cd $PSScriptRoot; & $PSCommandPath"
}else{
  # Generates a development environment for the project
  $modVersion= (ConvertFrom-Json (Get-Content .\bigger-artillery_VERSION\info.json -Raw)).version

  #Delete old mod folder
  Remove-Item -Recurse -Force "$env:appdata\Factorio\mods\bigger-artillery_*"

  $modPath="$env:appdata\Factorio\mods\bigger-artillery_$modVersion"
  New-Item -Path $modPath -ItemType SymbolicLink -Value .\bigger-artillery_VERSION
}
