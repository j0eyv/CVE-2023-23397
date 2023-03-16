Start-Transcript -Path c:\temp\OutlookPatch_Remediation.log -IncludeInvocationHeader -Append

#region Script
# Specify the registry path
$registryPath = "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration"
$CurrentChannel = "16130.20306"
$MonthlyEntChannel = "16026.20238"
$MonthlyEntChannel1 = "15928.20298"
$SemiEntChannel = "15601.20578"
$SemiEntChannel1 = "14931.2094"

# Check if the registry key exists
if (Test-Path $registryPath) {
    # Get the value of the ClientXnoneVersion registry key
    $clientXnoneVersion = (Get-ItemProperty -Path $registryPath).ClientXnoneVersion
    $VersionToReport = (Get-ItemProperty -Path $registryPath).VersionToReport

# Check if version exists
  if ($VersionToReport -like "*$CurrentChannel*" -or $VersionToReport -like "*$MonthlyEntChannel*" -or $VersionToReport -like "*$MonthlyEntChannel1*" -or $VersionToReport -like "*$SemiEntChannel*" -or $VersionToReport -like "*$SemiEntChannel1*") {
        
        cls
        Write-host ""
        Write-host "The current version $VersionToReport is supported" -f green
        Write-host "Check the following site for the supported versions" -f green
        Write-host "https://learn.microsoft.com/en-us/officeupdates/update-history-microsoft365-apps-by-date#supported-versions" -f green
        Write-host ""
        
    } else {
        
        cls
        Write-host ""
        Write-host "The current version $VersionToReport is not a suported version" -f Red
        Write-host "Check the following site for the supported versions" -f red
        Write-host "https://learn.microsoft.com/en-us/officeupdates/update-history-microsoft365-apps-by-date#supported-versions" -f Red
        # Execute the command
        & "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user displaylevel=false forceappshutdown=true
        Write-host ""
        
    }

}#end if (Test-Path $registryPath))


#endregion Script

 stop-transcript
