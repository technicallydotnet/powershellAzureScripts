[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $resourceGroup,
    # Name of the Virtual network that will be created
    [Parameter()]
    [string]
    $vnetName,
    # Location of the Resource group, VNet and subnets
    [Parameter()]
    [ParameterType]
    $location,
    # Number of subnets to create
    [Parameter()]
    [int]
    $numberOfSubnets
)
param($resourceGroup, $vnetName, $location, $numberOfSubnets)
Connect-AzAccount
$RG = Get-AzResourceGroup -Name $resourceGroup -ErrorVariable rg -ErrorAction SilentlyContinue
if($rg){
    $RG = New-AzResourceGroup -Name $resourceGroup -Location $location
}

$subnets = @()
for($s = 0; $s -lt $numberOfSubnets; $s++){
    $sub = New-AzVirtualNetworkSubnetConfig -Name ("subnet"+$s) -AddressPrefix ("10.0."+$s+".0/24")
    $subnets += $sub
}
New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup -Location $location -AddressPrefix "10.0.0.0/16" -Subnet $subnets
