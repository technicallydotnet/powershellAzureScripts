param($groupname, $location, $instances)
Connect-AzAccount
new-AzResourceGroup -Name $groupname -Location $location

# CREATE VIRTUAL NETWORK
#$vn = new-azvirtualnetwork -Name ($groupname + "_vm") -ResourceGroupName $groupname -Location $location -AddressPrefix "10.0.0.0/16" | Set-AzVirtualNetwork
#$subnet = Add-AzVirtualNetworkSubnetConfig -Name "web" -VirtualNetwork $vn -AddressPrefix "10.0.1.0/4"

#CREATE SERVICE PLAN AND WEB APPS
$serviceplan = new-azappserviceplan -ResourceGroupName $groupname -Name ($groupname + "_plan") -Tier "standard" -Location $location
if($instances -eq $null){
$instances = 2
}
for($i = 0; $i -lt $instances;$i++){
    New-AzWebApp -ResourceGroupName $groupname -Name ($groupname + "-"+ $location + "-web-" + $i)  -Location $location -AppServicePlan $serviceplan.Name
}
