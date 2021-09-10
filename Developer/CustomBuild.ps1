 # Set Variables
 $drive = 'C:\build'
 $ProgramFiles = 'C:\Program Files\'
 $RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
 $NotepadName = 'Notepad++'
 $VSCName = 'VSCode'
 $OSOptName = 'optimize'
 $MSCLIName = 'MSCLI'
 $GITName = 'GIT'
 $PS7Name = 'Powershell7'
 $BGInfoName = 'BGInfo'
 
 
 #download links
 $osOptURL = 'https://raw.githubusercontent.com/csaunders1401/Virtual-Desktop-Optimization-Tool/main/Master.zip'
 $NotepadPlusURL = 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.1.4/npp.8.1.4.Installer.x64.exe'
 $VSCodeURL = 'https://az764295.vo.msecnd.net/stable/3866c3553be8b268c8a7f8c0482c0c0177aa8bfa/VSCodeSetup-x64-1.59.1.exe'
 $MSCLIURL = 'https://aka.ms/installazurecliwindows'
 $GITURL = 'https://central.github.com/deployments/desktop/desktop/latest/win32'
 $PowershellURL = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/PowerShell-7.1.4-win-x64.msi'
 $Powershellx86URL = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/PowerShell-7.1.4-win-x86.msi'
 $BGInfoURL = 'https://download.sysinternals.com/files/BGInfo.zip'
 $BGInfoConfig = 'https://github.com/csaunders1401/WVD/blob/main/Developer/DEV.bgi?raw=true'

 # Exe Names
 $osOptURLexe = 'Windows_10_VDI_Optimize-master.zip'
 $NotepadPlusURLexe = 'npp.8.1.4.Installer.x64.exe'
 $VSCodeURLexe = 'VSCodeUserSetup-x64-1.59.1.exe'
 $MSCLIURLexe = 'Azure_CLI.msi'
 $GITURLexe = 'GitHubDesktopSetup-x64.exe'
 $PowershellURLexe = 'PowerShell-7.1.4-win-x64.msi'
 $Powershellx86URLexe = 'PowerShell-7.1.4-win-x86.msi'
 $BGInfoexe = 'BGInfo.zip'
 
  
 # Create Folder Structure
 New-Item -Path $drive -Name $OSOptName  -ItemType Directory -ErrorAction SilentlyContinue
 $OSOptPath = $drive + '\' + $OSOptName 
 set-Location $OSOptPath
 
 New-Item -Path $drive -Name $NotepadName  -ItemType Directory -ErrorAction SilentlyContinue
 $NotepadPath = $drive + '\' + $NotepadName 
 set-Location $NotepadPath

 New-Item -Path $drive -Name $VSCName  -ItemType Directory -ErrorAction SilentlyContinue
 $VSCPath = $drive + '\' + $VSCName 
 set-Location $VSCPath

 New-Item -Path $drive -Name $MSCLIName  -ItemType Directory -ErrorAction SilentlyContinue
 $MSCLIPath = $drive + '\' + $MSCLIName 
 set-Location $MSCLIPath

 New-Item -Path $drive -Name $GITName  -ItemType Directory -ErrorAction SilentlyContinue
 $GITPath = $drive + '\' + $GITName 
 set-Location $GITPath

 New-Item -Path $drive -Name $PS7Name  -ItemType Directory -ErrorAction SilentlyContinue
 $PS7Path = $drive + '\' + $PS7Name 
 set-Location $PS7Path

 New-Item -Path $drive -Name $BGInfoName  -ItemType Directory -ErrorAction SilentlyContinue
 New-Item -Path $ProgramFiles -Name $BGInfoName  -ItemType Directory -ErrorAction SilentlyContinue
 $BGInfoPath = $drive + '\' + $BGInfoName 
 set-Location $BGInfoPath

 # Download Files
 $NPoutputPath = $NotepadPath + '\' + $NotepadPlusURLexe
 Invoke-WebRequest -Uri $NotepadPlusURL -OutFile $NPoutputPath
 
 $outputPath = $OSOptPath + '\' + $osOptURLexe
 Invoke-WebRequest -Uri $osOptURL -OutFile $outputPath

 $VSCoutputPath = $VSCPath + '\' + $VSCodeURLexe
 Invoke-WebRequest -Uri $VSCodeURL -OutFile $VSCoutputPath

 $MSCLIoutputPath = $MSCLIPath + '\' + $MSCLIURLexe
 Invoke-WebRequest -Uri $MSCLIURL -OutFile $MSCLIoutputPath

 $GIToutputPath = $GITPath + '\' + $GITURLexe
 Invoke-WebRequest -Uri $GITURL -OutFile $GIToutputPath

 $PS7outputPath = $PS7Path + '\' + $PowershellURLexe
 Invoke-WebRequest -Uri $PowershellURL -OutFile $PS7outputPath

 $PS7x86outputPath = $PS7Path + '\' + $Powershellx86URLexe
 Invoke-WebRequest -Uri $Powershellx86URL -OutFile $PS7x86outputPath

 $BGInfooutputPath = $BGInfoPath + '\' + $BGInfoexe
 Invoke-WebRequest -Uri $BGInfoURL -OutFile $BGInfooutputPath
 Invoke-WebRequest -Uri $BGInfoConfig -OutFile 'C:\Program Files\BGInfo\Dev.bgi'

 # Install Notepad++ 
 write-host 'AIB Customization: Starting Install Notepad++'
 Start-Process -FilePath $NPoutputPath -Args "/S" -Wait
 write-host 'AIB Customization: Finished Install Notepad++'

 # Install VSCode
 write-host 'AIB Customization: Starting Install Latest Version of VS Code'
 Start-Process -FilePath $VSCoutputPath -Args "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -Wait
 write-host 'AIB Customization: Finished Install Latest Version of VS Code'

 # Install MS CLI
 write-host 'AIB Customization: Starting Install Microsoft CLI'
 Start-Process -FilePath $MSCLIoutputPath -Args "/qn" -Wait
 write-host 'AIB Customization: Finished Install Microsoft CLI' 

 #Install GIT Desktop
 write-host 'AIB Customization: Starting Install GIT for Windows'
 #Start-Process -FilePath $GIToutputPath -Args "-silent" -Wait
 Start-Process -FilePath "C:\build\GIT\GitHubDesktopSetup-x64.exe"
 write-host 'AIB Customization: Finished Install GIT for Windows' 

 # Install Powershell 7
 write-host 'AIB Customization: Starting Install Powershell 7 x64'
 Start-Process -FilePath $PS7outputPath -Args "/qn" -Wait
 write-host 'AIB Customization: Starting Install Powershell 7 x86'
 Start-Process -FilePath $PS7x86outputPath -Args "/qn" -Wait
 write-host 'AIB Customization: Finished Install Powershell 7' 

 #Install BGInfo
 write-host 'AIB Customization: Starting Install BGInfo'
 Expand-Archive -LiteralPath 'C:\build\BGInfo\BGInfo.zip' -DestinationPath 'C:\Program Files\BGInfo'
 New-ItemProperty -Path $RegistryPath -name 'bginfo' -Value '"C:\Program Files\BGInfo\Bginfo64.exe" "C:\Program Files\BGInfo\Dev.bgi" /timer:0 /nolicprompt'
 write-host 'AIB Customization: Finished Install BGInfo'

 # Install Bicep
 write-host 'AIB Customization: Starting Install BICEP'
 az bicep install
 write-host 'AIB Customization: Finished Install Bicep'

 #Run Optimization Script
    write-host 'AIB Customization: Starting OS Optimizations script'
    Expand-Archive -LiteralPath 'C:\\Build\\Optimize\\Windows_10_VDI_Optimize-master.zip' -DestinationPath $OSOptpath -Force -Verbose
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Verbose
    #Set-Location -Path C:\\Build\\Optimize\\Virtual-Desktop-Optimization-Tool-master
 
 
    # Patch: overide the Win10_VirtualDesktop_Optimize.ps1 - setting 'Set-NetAdapterAdvancedProperty'(see readme.md)
    Write-Host 'Patch: Disabling Set-NetAdapterAdvancedProperty'
    $updatePath= "C:\Build\optimize\Win10_VirtualDesktop_Optimize.ps1"
    ((Get-Content -path $updatePath -Raw) -replace 'Set-NetAdapterAdvancedProperty -DisplayName "Send Buffer Size" -DisplayValue 4MB','#Set-NetAdapterAdvancedProperty -DisplayName "Send Buffer Size" -DisplayValue 4MB') | Set-Content -Path $updatePath
 
    # Patch: overide the REG UNLOAD, needs GC before, otherwise will Access Deny unload(see readme.md)
    
    [System.Collections.ArrayList]$file = Get-Content $updatePath
    $insert = @()
    for ($i=0; $i -lt $file.count; $i++) {
    if ($file[$i] -like "*& REG UNLOAD HKLM\DEFAULT*") {
     $insert += $i-1 
        }
    }

    #add gc and sleep
    $insert | ForEach-Object { $file.insert($_,"                 Write-Host 'Patch closing handles and runnng GC before reg unload' `n              `$newKey.Handle.close()` `n              [gc]::collect() `n                Start-Sleep -Seconds 15 ") }
    Set-Content $updatePath $file 
  

 
    # run script
    # .\optimize -WindowsVersion 2004 -Verbose
    C:\build\optimize\Win10_VirtualDesktop_Optimize.ps1 -WindowsVersion 2004 -Verbose -AcceptEULA
    write-host 'AIB Customization: Finished OS Optimizations script'
 
  
 