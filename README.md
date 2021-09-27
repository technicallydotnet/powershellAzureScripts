## powershellAzureScripts
This is a repo for storing powershell scripts related to creating resources on Azure.

## websiteCreator
Creates a given number of web apps (instances) in a given region.

To use:

`.\websiteCreator.ps1 -groupname [name of group] -location [region/location] -instances [number of instances]`


instances is an optional parameter (By default 1 website instance will be created)


## GetVMTurnOnTurnOff
Gets a VM, by name and turns it on and off. Script was created in order to mantain configs in VMs that are turned off for long periods of time.
