# Virtual Machines

This module deploys one or multiple Virtual Machines.


## Resource types

|Resource Type|ApiVersion|
|:--|:--|
|`Microsoft.Compute/availabilitySets`|2020-12-01|
|`Microsoft.Compute/proximityPlacementGroups`|2020-12-01|
|`Microsoft.Compute/virtualMachines`|2020-06-01|
|`Microsoft.Compute/virtualMachines/extensions`|2019-07-01|
|`Microsoft.Resources/deployments`|2019-08-01|

## Parameters

| Parameter Name | Type | Description | DefaultValue | Possible values |
| :-- | :-- | :-- | :-- | :-- |
| `adminPassword` | securestring | Required. When specifying a Windows Virtual Machine, this value should be passed |  | |
| `adminUsername` | securestring | Required. Administrator username |  | |
| `allowExtensionOperations` | bool | Optional. Specifies whether extension operations should be allowed on the virtual machine. This may only be set to False when no extensions are present on the virtual machine. | True | |
| `availabilitySetFaultDomain` | int | Optional. The number of fault domains to use. | 2 | |
| `availabilitySetName` | string | Optional. Creates an availability set with the given name and adds the VMs to it. Cannot be used in combination with availability zone nor scale set. |  | |
| `availabilitySetSku` | string | Optional. Sku of the availability set. Use 'Aligned' for virtual machines with managed disks and 'Classic' for virtual machines with unmanaged disks. | Aligned | |
| `availabilitySetUpdateDomain` | int | Optional. The number of update domains to use. | 5 | |
| `availabilityZone` | int | Optional. If set to 1, 2 or 3, the availability zone for all VMs is hardcoded to that value. If zero, then the automatic algorithm will be used to give every VM in a different zone (up to three zones). Cannot be used in combination with availability set nor scale set. | 0 | 0, 1, 2, 3 |
| `backupPolicyName` | string | Optional. Backup policy the VMs should be using for backup. | DefaultPolicy | |
| `backupVaultName` | string | Optional. Recovery service vault name to add VMs to backup. |  | |
| `backupVaultResourceGroup` | string | Optional. Resource group of the backup recovery service vault. |  | |
| `baseTime` | string | Generated. Do not provide a value! This date value is used to generate a registration token. | [utcNow('u')] | |
| `bootDiagnosticStorageAccountName` | string | Optional. Storage account used to store boot diagnostic information. Boot diagnostics will be disabled if no value is provided. |  | |
| `bootDiagnosticStorageAccountUri` | string | Optional. Storage account boot diagnostic base URI. | .blob.core.windows.net/ | |
| `certificatesToBeInstalled` | array | Optional. Specifies set of certificates that should be installed onto the virtual machine. | | |
| `cuaId` | string | Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered |  | |
| `customData` | string | Optional. Custom data associated to the VM, this value will be automatically converted into base64 to account for the expected VM format. |  | |
| `dataDisks` | array | Optional. Specifies the data disks. | System.Object[] | |
| `dedicatedHostId` | string | Optional. Specifies resource Id about the dedicated host that the virtual machine resides in. |  | |
| `diagnosticSettingName` | string | Optional. The name of the Diagnostic setting. | service |  |
| `diagnosticLogsRetentionInDays` | int | Optional. Specifies the number of days that logs will be kept for; a value of 0 will retain data indefinitely. | 365 | |
| `diagnosticStorageAccountId` | string | Optional. Resource identifier of the Diagnostic Storage Account. |  | |
| `diskEncryptionVolumeType` | string | Optional. Type of the volume OS or Data to perform encryption operation | All | |
| `diskKeyEncryptionAlgorithm` | string | Optional. Specifies disk key encryption algorithm. | RSA-OAEP | |
| `domainJoinOptions` | int | Optional. Set of bit flags that define the join options. Default value of 3 is a combination of NETSETUP_JOIN_DOMAIN (0x00000001) & NETSETUP_ACCT_CREATE (0x00000002) i.e. will join the domain and create the account on the domain. For more information see https://msdn.microsoft.com/en-us/library/aa392154(v=vs.85).aspx | 3 | |
| `domainJoinOU` | string | Optional. Specifies an organizational unit (OU) for the domain account. Enter the full distinguished name of the OU in quotation marks. Example: "OU=testOU; DC=domain; DC=Domain; DC=com" |  | |
| `domainJoinPassword` | securestring | Optional. Required if domainName is specified. Password of the user specified in domainJoinUser parameter |  | |
| `domainJoinRestart` | bool | Optional. Controls the restart of vm after executing domain join | False | |
| `domainJoinUser` | string | Optional. Mandatory if domainName is specified. User used for the join to the domain. Format: username@domainFQDN |  | |
| `domainName` | string | Optional. Specifies the FQDN the of the domain the VM will be joined to. Currently implemented for Windows VMs only |  | |
| `dscConfiguration` | object | Optional. The DSC configuration object |  | |
| `enableEvictionPolicy` | bool | Optional. Specifies the eviction policy for the low priority virtual machine. Will result in 'Deallocate' eviction policy. | False | |
| `enableLinuxDependencyAgent` | bool | Optional. Specifies if Azure Dependency Agent for Linux VM should be enabled. Requires LinuxMMAAgent to be enabled. | False | |
| `enableLinuxDiskEncryption` | bool | Optional. Specifies if Linux VM disks should be encrypted. If enabled, boot diagnostics must be enabled as well. | False | |
| `enableLinuxMMAAgent` | bool | Optional. Specifies if MMA agent for Linux VM should be enabled. | False | |
| `enableMicrosoftAntiMalware` | bool | Optional. Enables Microsoft Windows Defender AV. | False | |
| `enableNetworkWatcherLinux` | bool | Optional. Specifies if Azure Network Watcher Agent for Linux VM should be enabled. | False | |
| `enableNetworkWatcherWindows` | bool | Optional. Specifies if Azure Network Watcher Agent for Windows VM should be enabled. | False | |
| `enableServerSideEncryption` | bool | Optional. Specifies if Windows VM disks should be encrypted with Server-side encryption + Customer managed Key. | False | |
| `enableWindowsDependencyAgent` | bool | Optional. Specifies if Azure Dependency Agent for Windows VM should be enabled. Requires WindowsMMAAgent to be enabled. | False | |
| `enableWindowsDiskEncryption` | bool | Optional. Specifies if Windows VM disks should be encrypted. If enabled, boot diagnostics must be enabled as well. | False | |
| `enableWindowsMMAAgent` | bool | Optional. Specifies if MMA agent for Windows VM should be enabled. | False | |
| `eventHubAuthorizationRuleId` | string | Optional. Resource ID of the event hub authorization rule for the Event Hubs namespace in which the event hub should be created or streamed to. |  | |
| `eventHubName` | string | Optional. Name of the event hub within the namespace to which logs are streamed. Without this, an event hub is created for each log category. |  | |
| `forceUpdateTag` | string | Optional. Pass in an unique value like a GUID everytime the operation needs to be force run | 1.0 |  |
| `imageReference` | object | Optional. OS image reference. In case of marketplace images, it's the combination of the publisher, offer, sku, version attributes. In case of custom images it's the resource ID of the custom image. |  | |
| `keyEncryptionKeyURL` | string | Optional. URL of the KeyEncryptionKey used to encrypt the volume encryption key |  | |
| `keyVaultId` | string | Optional. Resource identifier of the Key Vault instance where the Key Encryption Key (KEK) resides |  |  |
| `keyVaultUri` | string | Optional. URL of the Key Vault instance where the Key Encryption Key (KEK) resides |  | |
| `licenseType` | string | Optional. Specifies that the image or disk that is being used was licensed on-premises. This element is only used for images that contain the Windows Server operating system. |  | |
| `linuxConfiguration` | object | Optional. Specifies the Linux operating system settings on the virtual machine. |  | |
| `location` | string | Optional. Location for all resources. | [resourceGroup().location] | |
| `lockForDeletion` | bool | Optional. Switch to lock VM from deletion. | False | |
| `maxPriceForLowPriorityVm` | string | Optional. Specifies the maximum price you are willing to pay for a low priority VM/VMSS. This price is in US Dollars. |  | |
| `microsoftAntiMalwareSettings` | object | Optional. Settings for Microsoft Windows Defender AV extension. |  | |
| `nicConfigurations` | array | Required. Configures NICs and PIPs. |  | |
| `osDisk` | object | Required. Specifies the OS disk. |  | |
| `plan` | object | Optional. Specifies information about the marketplace image used to create the virtual machine. This element is only used for marketplace images. Before you can use a marketplace image from an API, you must enable the image for programmatic use. |  | |
| `proximityPlacementGroupName` | string | Optional. Creates an proximity placement group and adds the VMs to it. |  | |
| `proximityPlacementGroupType` | string | Optional. Specifies the type of the proximity placement group. | Standard | |
| `resizeOSDisk` | bool | Optional. Should the OS partition be resized to occupy full OS VHD before splitting system volume | False | |
| `roleAssignments` | array | Optional. Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11' | | |
| `sasTokenValidityLength` | string | Optional. SAS token validity length to use to download files from storage accounts. Usage: 'PT8H' - valid for 8 hours; 'P5D' - valid for 5 days; 'P1Y' - valid for 1 year. When not provided, the SAS token will be valid for 8 hours. | PT8H | |
| `tags` | object | Optional. Tags of the resource. |  | |
| `ultraSSDEnabled` | bool | Optional. The flag that enables or disables a capability to have one or more managed data disks with UltraSSD_LRS storage account type on the VM or VMSS. Managed disks with storage account type UltraSSD_LRS can be added to a virtual machine or virtual machine scale set only if this property is enabled. | False | |
| `useAvailabilityZone` | bool | Optional. Creates an availability zone and adds the VMs to it. Cannot be used in combination with availability set nor scale set. | False | |
| `vmComputerNames` | object | Optional. Specifies the VM computer names for the VMs. If the VM name is not in the object as key the VM name is used as computer name. Be aware of the maximum size of 15 characters and limitations regarding special characters for the computer name. Once set it can't be changed via template. | {} | |
| `vmComputerNamesTransformation` | string | Optional. Specifies whether the computer names should be transformed. The transformation is performed on all computer names. Available transformations are 'none' (Default), 'uppercase' and 'lowercase'. | none | none, uppercase, lowercase |
| `vmInitialNumber` | int | Optional. If no explicit values were provided in the vmNames parameter, this parameter will be used to generate VM names, using the vmNamePrefix and the vmNumberOfInstances values. | 1 | |
| `vmNamePrefix` | string | Optional. If no explicit values were provided in the vmNames parameter, this prefix will be used in combination with the vmNumberOfInstances and the vmInitialNumber parameters to create unique VM names. You should use a unique prefix to reduce name collisions in Active Directory. If no value is provided, a 10 character long unique string will be generated based on the Resource Group's name. | [take(toLower(uniqueString(resourceGroup().name)),10)] | |
| `vmNames` | array | Optional. Name(s) of the virtual machine(s). If no explicit names are provided, VM name(s) will be generated based on the vmNamePrefix, vmNumberOfInstances and vmInitialNumber parameters. | | |
| `vmNumberOfInstances` | int | Optional. If no explicit values were provided in the vmNames parameter, this parameter will be used to generate VM names, using the vmNamePrefix and the vmInitialNumber values. | 1 | |
| `vmPriority` | string | Optional. Specifies the priority for the virtual machine. | Regular |
| `vmSize` | string | Optional. Specifies the size for the VMs | Standard_D2s_v3 | |
| `windowsConfiguration` | object | Optional. Specifies Windows operating system settings on the virtual machine. |  | |
| `windowsScriptExtensionCommandToExecute` | securestring | Optional. Specifies the command that should be run on a Windows VM. |  | |
| `windowsScriptExtensionFileData` | array | Optional. Array of objects that specifies URIs and the storageAccountId of the scripts that need to be downloaded and run by the Custom Script Extension on a Windows VM. | | |
| `cseStorageAccountName` | string | Optional. The name of the storage account to fetch to blob data from | | |
| `cseStorageAccountKey` | string |  Optional. The key of the storage account to fetch the FileData blobs from | | |
| `cseManagedIdentity` | string | Optional. The managed identity to use to fetch the blob data. | | |
| `workspaceId` | string | Optional. Resource identifier of Log Analytics. |  | |

### Parameter Usage: `imageReference`

#### Marketplace images

```json
"imageReference": {
    "value": {
        "publisher": "MicrosoftWindowsServer",
        "offer": "WindowsServer",
        "sku": "2016-Datacenter",
        "version": "latest"
    }
}
```

#### Custom images

```json
"imageReference": {
    "value": {
        "id": "/subscriptions/12345-6789-1011-1213-15161718/resourceGroups/rg-name/providers/Microsoft.Compute/images/imagename"
    }
}
```

### Parameter Usage: `plan`

```json
"plan": {
    "value": {
        "name": "qvsa-25",
        "product": "qualys-virtual-scanner",
        "publisher": "qualysguard"
    }
}
```

### Parameter Usage: `osDisk`

```json
 "osDisk": {
    "value": {
        "createOption": "fromImage",
        "diskSizeGB": "128",
        "managedDisk": {
            "storageAccountType": "Premium_LRS"
        }
    }
}
```

### Parameter Usage: `dataDisks`

```json
"dataDisks": {
    "value": [{
        "caching": "ReadOnly",
        "createOption": "Empty",
        "diskSizeGB": "256",
        "managedDisk": {
            "storageAccountType": "Premium_LRS"
        }
    },
    {
        "caching": "ReadOnly",
        "createOption": "Empty",
        "diskSizeGB": "128",
        "managedDisk": {
            "storageAccountType": "Premium_LRS"
        }
    }]
}
```

### Parameter Usage: `windowsConfiguration`

To set the time zone of a VM with the timeZone parameter inside windowsConfiguration, use the following PS command to get the correct options:

```powershell
Get-TimeZone -ListAvailable | Select Id
```

```json
"windowsConfiguration": {
    "provisionVMAgent": "boolean",
    "enableAutomaticUpdates": "boolean",
    "timeZone": "string",
    "additionalUnattendContent": [
        {
        "passName": "OobeSystem",
        "componentName": "Microsoft-Windows-Shell-Setup",
        "settingName": "string",
        "content": "string"
        }
    ],
    "winRM": {
        "listeners": [
        {
            "protocol": "string",
            "certificateUrl": "string"
        }
        ]
    }
}
```

### Parameter Usage: `linuxConfiguration`

```json
"linuxConfiguration": {
    "disablePasswordAuthentication": "boolean",
    "ssh": {
        "publicKeys": [
        {
            "path": "string",
            "keyData": "string"
        }
        ]
    },
    "provisionVMAgent": "boolean"
    },
    "secrets": [
    {
        "sourceVault": {
        "id": "string"
        },
        "vaultCertificates": [
        {
            "certificateUrl": "string",
            "certificateStore": "string"
        }
        ]
    }
    ],
    "allowExtensionOperations": "boolean",
    "requireGuestProvisionSignal": "boolean"
}
```

### Parameter Usage: `nicConfigurations`

The field `nicSuffix` and `subnetId` are mandatory. If `enablePublicIP` is set to true, then `publicIpNameSuffix` is also mandatory. Each IP config needs to have the mandatory field `name`.

```json
"value": [{
    "nicSuffix": "-nic-01",
    "enableIPForwarding": false,
    "enableAcceleratedNetworking": false,
    "dnsServers": [
        "8.8.8.8"
    ],
    "ipConfigurations": [{
            "name": "ipconfig1",
            "vmIPAddress": "",
            "subnetId": "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/rgName/providers/Microsoft.Network/virtualNetworks/vnetName/subnets/subnetName",
            "enablePublicIP": true,
            "publicIpNameSuffix": "-pip-01",
            "publicIPPrefixId": "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/rgName/providers/Microsoft.Network/publicIPPrefixes/pippfx-europe",
            "loadBalancerBackendPoolId": "",
            "applicationSecurityGroupId": ""
        },
        {
            "name": "ipconfig2",
            "vmIPAddress": "",
            "subnetId": "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/rgName/providers/Microsoft.Network/virtualNetworks/vnetName/subnets/subnetName",
            "enablePublicIP": false,
            "publicIpNameSuffix": "",
            "loadBalancerBackendPoolId": "",
            "applicationSecurityGroupId": ""
        }
    ]
},
{
    "nicSuffix": "-nic-02",
    "enableIPForwarding": false,
    "enableAcceleratedNetworking": false,
    "dnsServers": [
        "8.8.8.8"
    ],
    "ipConfigurations": [{
        "name": "ipconfig1",
        "vmIPAddress": "",
        "subnetId": "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/rgName/providers/Microsoft.Network/virtualNetworks/vnetName/subnets/subnetName",
        "enablePublicIP": true,
        "publicIpNameSuffix": "-pip-02",
        "loadBalancerBackendPoolId": "",
        "applicationSecurityGroupId": ""
    }]
}
]

### Parameter Usage: `microsoftAntiMalwareSettings`

```json
"microsoftAntiMalwareSettings": {
    "AntimalwareEnabled": true,
    "Exclusions": {
        "Extensions": ".log;.ldf",
        "Paths": "D:\\IISlogs;D:\\DatabaseLogs",
        "Processes": "mssence.svc"
    },
    "RealtimeProtectionEnabled": true,
    "ScheduledScanSettings": {
        "isEnabled": "true",
        "scanType": "Quick",
        "day": "7",
        "time": "120"
    }
}
```

### Parameter Usage: `windowsScriptExtensionFileData`

```json
"windowsScriptExtensionFileData": {
    "value": [
        //storage accounts with SAS token requirement
        {
            "uri": "https://storageAccount.blob.core.windows.net/wvdscripts/File1.ps1",
            "storageAccountId": "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/rgName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
        },
        {
            "uri": "https://storageAccount.blob.core.windows.net/wvdscripts/File2.ps1",
            "storageAccountId": "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/rgName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
        },
        //storage account with public container (no SAS token is required) OR other public URL (not a storage account)
        {
            "uri": "https://github.com/myProject/File3.ps1",
            "storageAccountId": ""
        }
    ]
}
```

### Parameter Usage: `windowsScriptExtensionFileData` with native storage account key support

```json
"windowsScriptExtensionFileData": {
    "value": [
        {
            "https://mystorageaccount.blob.core.windows.net/wvdscripts/testscript.ps1"
        }
    ]
},
"windowsScriptExtensionCommandToExecute": {
   "value": "powershell -ExecutionPolicy Unrestricted -File testscript.ps1"
},
"cseStorageAccountName": {
   "value": "mystorageaccount"
},
"cseStorageAccountKey": {
  "value": "4k43kfjd3"
}
```

### Parameter Usage: `dscConfiguration`

```json
"dscConfiguration": {
    "value": {
        "settings": {
            "wmfVersion": "latest",
            "configuration": {
                "url": "http://validURLToConfigLocation",
                "script": "ConfigurationScript.ps1",
                "function": "ConfigurationFunction"
            },
            "configurationArguments": {
                "argument1": "Value1",
                "argument2": "Value2"
            },
            "configurationData": {
                "url": "https://foo.psd1"
            },
            "privacy": {
                "dataCollection": "enable"
            },
            "advancedOptions": {
                "forcePullAndApply": false,
                "downloadMappings": {
                    "specificDependencyKey": "https://myCustomDependencyLocation"
                }
            }
        },
        "protectedSettings": {
            "configurationArguments": {
                "mySecret": "PasswordValue1"
            },
            "configurationUrlSasToken": "?g!bber1sht0k3n",
            "configurationDataUrlSasToken": "?dataAcC355T0k3N"
        }
    }
}
```

### Parameter Usage: `roleAssignments`

```json
"roleAssignments": {
    "value": [
        {
            "roleDefinitionIdOrName": "Desktop Virtualization User",
            "principalIds": [
                "12345678-1234-1234-1234-123456789012", // object 1
                "78945612-1234-1234-1234-123456789012" // object 2
            ]
        },
        {
            "roleDefinitionIdOrName": "Reader",
            "principalIds": [
                "12345678-1234-1234-1234-123456789012", // object 1
                "78945612-1234-1234-1234-123456789012" // object 2
            ]
        },
        {
            "roleDefinitionIdOrName": "/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11",
            "principalIds": [
                "12345678-1234-1234-1234-123456789012" // object 1
            ]
        }
    ]
}
```

### Parameter Usage: `tags`

Tag names and tag values can be provided as needed. A tag can be left without a value.

```json
"tags": {
    "value": {
        "Environment": "Non-Prod",
        "Contact": "test.user@testcompany.com",
        "PurchaseOrder": "1234",
        "CostCenter": "7890",
        "ServiceName": "DeploymentValidation",
        "Role": "DeploymentValidation"
    }
}
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `vmNames` | array | The Names of the VMs. |
| `vmResourceGroup` | string | The name of the Resource Group the VM(s) was/were created in. |
| `vmResourceIds` | array | The Resource Id(s) of the VM(s). |

## Considerations

*N/A*

## Additional resources

- [Overview of Windows virtual machines in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/overview)
- [Microsoft.Compute virtualMachines template reference](https://docs.microsoft.com/en-us/azure/templates/microsoft.compute/allversions)
- [Use tags to organize your Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-using-tags)
- [PowerShell DSC Extension](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/dsc-windows#extension-schema)