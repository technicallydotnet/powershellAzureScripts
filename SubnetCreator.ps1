param($resourceGroup, $vnetName, $location, $numberOfSubnets)
Connect-AzAccount
$RG = Get-AzResourceGroup -Name $resourceGroup -ErrorVariable rg -ErrorAction SilentlyContinue
if($rg){
    $RG = New-AzResourceGroup -Name $resourceGroup -Location $location
}
$vnet = New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup -Location $location -AddressPrefix "10.0.0.0/16"
$subnets = @()
for($s = 0; $s -lt $numberOfSubnets; $s++){
    $sub = New-AzVirtualNetworkSubnetConfig -Name ("subnet"+$s) -AddressPrefix ("10.0."+$s+".0/24")
    $sub | Set-AzVirtualNetwork
}
