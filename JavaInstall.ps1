cd C:\temp\

try {
    Write-Host 'Installing JDK-x64'
    $proc1 = Start-Process -FilePath "C:\temp\jdk-11.0.2_windows-x64_bin.exe" -ArgumentList "/s REBOOT=ReallySuppress" -Wait -PassThru
    $proc1.waitForExit()
    Write-Host 'Installation Done.'
 
} catch [exception] {
    write-host '$_ is' $_
    write-host '$_.GetType().FullName is' $_.GetType().FullName
    write-host '$_.Exception is' $_.Exception
    write-host '$_.Exception.GetType().FullName is' $_.Exception.GetType().FullName
    write-host '$_.Exception.Message is' $_.Exception.Message
}
 
if ((Test-Path "c:\Program Files (x86)\Java") -Or (Test-Path "c:\Program Files\Java")) {
    Write-Host 'Java installed successfully.'
}
Write-Host 'Setting up Path variables.'
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", "c:\Program Files (x86)\Java\jdk-11.0.2", "Machine")
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";c:\Program Files (x86)\Java\jdk-11.0.2\bin", "Machine")
Write-Host 'Done. Goodbye.'
