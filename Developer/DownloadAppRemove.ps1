    $url = "https://raw.githubusercontent.com/csaunders1401/WVD/main/Developer/RemoveApps.xml"
    $output = "C:\temp\RemoveApps.xml"
    Invoke-WebRequest -Uri $url -OutFile $output