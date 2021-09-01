 
 # install VSCode
 write-host 'AIB Customization: Install VSCode'
 $appName = 'VSCode'
 $drive = 'C:\Build\'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 $VSCodeURL = 'https://az764295.vo.msecnd.net/stable/3866c3553be8b268c8a7f8c0482c0c0177aa8bfa/VSCodeSetup-x64-1.59.1.exe'
 $VSCodeURLexe = 'VSCodeUserSetup-x64-1.59.1.exe'
 $outputPath = $LocalPath + '\' + $VSCodeURLexe
 Invoke-WebRequest -Uri $VSCodeURL -OutFile $outputPath
 write-host 'AIB Customization: Starting Install Latest Version of VS Code'
 Start-Process -FilePath $outputPath -Args "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -Wait
 write-host 'AIB Customization: Finished Install Latest Version of VS Code'