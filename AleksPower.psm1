<#
 .Synopsis
  A Collection of useful scripts

 .Description
  Scripts for tasks

 .Example
   # Highlight a range of days.
   Show-Calendar -HighlightDay (1..10 + 22) -HighlightDate "December 25, 2008"
#>


function Get-StoppedServices {
    Get-Service | Where-Object {$_.Status -eq "Stopped"} | More
}

New-Alias -Name gss -Value Get-StoppedServices -Description "Show all services currently in stopped state"

function Get-RunningServices {
    Get-Service | Where-Object {$_.Status -eq "Running"} | More
}

New-Alias -Name grs -Value Get-RunningServices -Description "Show all services currently in Running state"


function Get-LikeServices {
Param($name)
    Get-Service | Where-Object {$_.DisplayName -like $name} | More
}

New-Alias -Name gls -Value Get-LikeServices -Description "Get services based on DisplayName"


function Get-ADFSMO{

$ADresults = @()
$ADresults += Get-ADDomain | Select-Object InfrastructureMaster,PDCEmulator,RIDMaster
$ADresults += Get-ADForest | Select-Object DomainNamingMaster,SchemaMaster
Write-Output $ADresults | Format-List
}

New-Alias -Name adfsmo -Value Get-ADFSMO -Description "Show server hosting AD FSMO Roles"


Export-ModuleMember -alias * -Function *