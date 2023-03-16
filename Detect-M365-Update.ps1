Start-Transcript -Path c:\temp\OutlookPatch_Detection.log -IncludeInvocationHeader

$registryPath = "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration"
$CurrentChannel = "16130.20306"
$MonthlyEntChannel = "16026.20238"
$MonthlyEntChannel1 = "15928.20298"
$SemiEntChannel = "15601.20578"
$SemiEntChannel1 = "14931.2094"
$clientXnoneVersion = (Get-ItemProperty -Path $registryPath).ClientXnoneVersion
$VersionToReport = (Get-ItemProperty -Path $registryPath).VersionToReport


# Check if version exists
  if ($VersionToReport -like "*$CurrentChannel*" -or $VersionToReport -like "*$MonthlyEntChannel*" -or $VersionToReport -like "*$MonthlyEntChannel1*" -or $VersionToReport -like "*$SemiEntChannel*" -or $VersionToReport -like "*$SemiEntChannel1*") {
        
        cls
        Write-host ""
        Write-Output "The version $VersionToReport is detected"
        Write-host ""

        Exit 0 
        
    } else {
        
        cls
        Write-host ""
        Write-host "The current version $VersionToReport is not a suported version" -f Red
        Write-host ""
        Exit 1
        
        
    }



stop-transcript
