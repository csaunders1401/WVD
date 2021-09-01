  # install Microsoft CLI
 write-host 'AIB Customization: Install Microsoft CLI'
 $appName = 'MSCLI'
 $drive = 'C:\Build'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 $MSCLIURL = 'https://aka.ms/installazurecliwindows'
 $MSCLIURLexe = 'Azure_CLI.msi'
 $outputPath = $LocalPath + '\' + $MSCLIURLexe
 Invoke-WebRequest -Uri $MSCLIURL -OutFile $outputPath
 write-host 'AIB Customization: Starting Install Microsoft CLI'
 Start-Process -FilePath $outputPath -Args "/qn" -Wait
 write-host 'AIB Customization: Finished Install Microsoft CLI' 