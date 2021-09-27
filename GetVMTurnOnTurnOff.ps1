[CmdletBinding()]
param ([Parameter()]
    [TypeName]$VMName)
Get-AzVM -Name $VMName | Start-AzVM -Name $VMName | Stop-AzVM -Name $VMName;