# install PowerShell
 write-host 'AIB Customization: Install Powershell 7'
 $appName = 'Powershell7'
 $drive = 'C:\Build'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath

 #install x64
 $PowershellURL = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/PowerShell-7.1.4-win-x64.msi'
 $PowershellURLexe = 'PowerShell-7.1.4-win-x64.msi'
 $outputPath = $LocalPath + '\' + $PowershellURLexe
 Invoke-WebRequest -Uri $GITURL -OutFile $outputPath
 write-host 'AIB Customization: Starting Install Powershell 7'
 Start-Process -FilePath $outputPath -Args "/qn" -Wait

 #install x86
 $PowershellURL = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/PowerShell-7.1.4-win-x86.msi'
 $PowershellURLexe = 'PowerShell-7.1.4-win-x86.msi'
 $outputPath = $LocalPath + '\' + $PowershellURLexe
 Invoke-WebRequest -Uri $GITURL -OutFile $outputPath
 write-host 'AIB Customization: Starting Install Powershell 7'
 Start-Process -FilePath $outputPath -Args "/qn" -Wait

 #complete
 write-host 'AIB Customization: Finished Install Powershell 7' 