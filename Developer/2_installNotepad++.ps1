 
 # install Notepad++
 write-host 'AIB Customization: Install NotePadd++'
 $appName = 'Notepad++'
 $drive = 'C:\'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 $NotepadPlusURL = 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.1.1/npp.8.1.1.Installer.x64.exe'
 $NotepadPlusURLexe = 'npp.8.1.1.Installer.x64.exe'
 $outputPath = $LocalPath + '\' + $NotepadPlusURLexe
 Invoke-WebRequest -Uri $NotepadPlusURL -OutFile $outputPath
 write-host 'AIB Customization: Starting Install Notepad++'
 Start-Process -FilePath $outputPath -Args "/S" -Wait
 write-host 'AIB Customization: Finished Install Notepad++'
 
 
 