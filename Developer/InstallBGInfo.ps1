# install BGInfo
 write-host 'AIB Customization: Install BGInfo'
 $appName = 'BGInfo'
 $drive = 'C:\'
 $ProgramFiles = 'C:\Program Files\'
 $RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 New-Item -Path $ProgramFiles -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 $BGInfoURL = 'https://download.sysinternals.com/files/BGInfo.zip'
 $BGInfoConfig = 'https://github.com/csaunders1401/WVD/blob/main/Developer/DEV.bgi?raw=true'
 $BGINFOShortcut = 'https://github.com/csaunders1401/WVD/blob/main/Developer/Bginfo.lnk?raw=true'
 $BGInfoexe = 'BGInfo.zip'
 $outputPath = $LocalPath + '\' + $BGInfoexe
 Invoke-WebRequest -Uri $BGInfoURL -OutFile $outputPath
 Invoke-WebRequest -Uri $BGInfoConfig -OutFile 'C:\Program Files\BGInfo\Dev.bgi'
 Invoke-WebRequest -Uri $BGInfoConfig -OutFile  'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\BGInfo.lnk'
 write-host 'AIB Customization: Starting Install BGInfo'
 Expand-Archive -LiteralPath 'C:\BGInfo\BGInfo.zip' -DestinationPath 'C:\Program Files\BGInfo'
# Start-Process -FilePath $outputPath -Args "/S" -Wait
write-host 'AIB Customization: Finished Install BGInfo'
New-ItemProperty -Path $RegistryPath -name 'bginfo' -Value '"C:\Program Files\BGInfo\Bginfo64.exe" "C:\Program Files\BGInfo\Dev.bgi" /timer:0 /nolicprompt'
#'@echo off
#cd
#CALL "C:\Program Files\BGInfo\bginfo.exe" "C:\Program Files\BGInfo\DEV.bgi" /timer:0 /nolicprompt' |Out-File 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\Run.bat'
#$WindowsVersion = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseId

