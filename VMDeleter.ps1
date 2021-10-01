[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $VMResourceGroupName
)
#Connect to Azure
Connect-AzAccount
#Delete all VMs in a given resource group
foreach ($resource_group in Get-AzResourceGroup) {
    if ($resource_group -eq $VMResourceGroupName) {
        Get-AzVM -ResourceGroupName $VMResourceGroupName | Stop-AzVM -ResourceGroupName $VMResourceGroupName | Remove-AzVm -ResourceGroupName $VMResourceGroupName
    }
}