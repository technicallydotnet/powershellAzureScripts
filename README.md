## powershellAzureScripts
This is a repo for storing powershell scripts related to creating resources on Azure.

## websiteCreator
Creates a given number of web apps (instances) in a given region.

To use:

`.\websiteCreator.ps1 -groupname [name of group] -location [region/location] -instances [number of instances]`


instances is an optional parameter (By default 1 website instance will be created)


## GetVMTurnOnTurnOff
Gets a VM, by name and turns it on and off. Script was created in order to mantain configs in VMs that are turned off for long periods of time.


## VMDeleter
Removes all VMs in a given Resource group, according to the name of the resource group. Will search through the subscription that the user is currently logged into.

## SubnetCreator
Creates a Resource group with a given number of subnets and a corresponding Virtual Network
