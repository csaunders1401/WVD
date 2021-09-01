  # install Git for Windows
 write-host 'AIB Customization: Install GIT for Windows'
 $appName = 'GIT'
 $drive = 'C:\Build'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 $GITURL = 'https://central.github.com/deployments/desktop/desktop/latest/win32'
 $GITURLexe = 'GitHubDesktopSetup-x64.exe'
 $outputPath = $LocalPath + '\' + $GITURLexe
 Invoke-WebRequest -Uri $GITURL -OutFile $outputPath
 write-host 'AIB Customization: Starting Install GIT for Windows'
 Start-Process -FilePath $outputPath -Args "-silent" -Wait
 write-host 'AIB Customization: Finished Install GIT for Windows' 