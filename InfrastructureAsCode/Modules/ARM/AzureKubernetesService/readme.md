# AzureKubernetesService

This module deploys Azure Kubernetes Cluster (AKS).

## Resource types

| Resource Type | Api Version |
| :-- | :-- |
| `Microsoft.ContainerService/managedClusters/agentPools` | 2020-07-01 |
| `Microsoft.ContainerService/managedClusters/providers/diagnosticsettings` | 2017-05-01-preview |
| `Microsoft.ContainerService/managedClusters/providers/roleAssignments` | 2018-09-01-preview |
| `Microsoft.ContainerService/managedClusters` | 2020-11-01 |
| `Microsoft.Resources/deployments` | 2020-06-01 |

## Parameters

| Parameter Name | Type | Default Value | Possible values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `aadProfileAdminGroupObjectIDs` | array | System.Object[] |  | Optional. Specifies the AAD group object IDs that will have admin role of the cluster. |
| `aadProfileEnableAzureRBAC` | bool | True |  | Optional. Specifies whether to  to enable Azure RBAC for Kubernetes authorization. |
| `aadProfileManaged` | bool | True |  | Optional. Specifies whether to enable managed AAD integration. |
| `aadProfileTenantId` | string | [subscription().tenantId] |  | Optional. Specifies the tenant id of the Azure Active Directory used by the AKS cluster for authentication. |
| `aciConnectorLinuxEnabled` | bool | False |  | Optional. Specifies whether the aciConnectorLinux add-on is enabled or not. |
| `additionalAgentPools` | array | System.Object[] |  | Required. Define one or multiple node pools |
| `aksClusterAdminUsername` | string | azureuser |  | Optional. Specifies the administrator username of Linux virtual machines. |
| `aksClusterDnsPrefix` | string | [parameters('aksClusterName')] |  | Required. Specifies the DNS prefix specified when creating the managed cluster. |
| `aksClusterDnsServiceIP` | string | 10.2.0.10 |  | Required. Specifies the IP address assigned to the Kubernetes DNS service. It must be within the Kubernetes service address range specified in serviceCidr. |
| `aksClusterDockerBridgeCidr` | string | 172.17.0.1/16 |  | Required. Specifies the CIDR notation IP range assigned to the Docker bridge network. It must not overlap with any Subnet IP ranges or the Kubernetes service address range. |
| `aksClusterEnablePrivateCluster` | bool | False |  | Optional. Specifies whether to create the cluster as a private cluster or not. |
| `aksClusterKubernetesVersion` | string | 1.18.8 |  | Required. Specifies the version of Kubernetes specified when creating the managed cluster. |
| `aksClusterLoadBalancerSku` | string | standard | System.Object[] | Required. Specifies the sku of the load balancer used by the virtual machine scale sets used by nodepools. |
| `aksClusterName` | string | [concat('aks-', uniqueString(resourceGroup().id))] |  | Required. Specifies the name of the AKS cluster. |
| `aksClusterNetworkPlugin` | string | azure | System.Object[] | Required. Specifies the network plugin used for building Kubernetes network. - azure or kubenet. |
| `aksClusterNetworkPolicy` | string | azure | System.Object[] | Required. Specifies the network policy used for building Kubernetes network. - calico or azure |
| `aksClusterOutboundType` | string | loadBalancer | System.Object[] | Required. Specifies outbound (egress) routing method. - loadBalancer or userDefinedRouting. |
| `aksClusterPodCidr` | string | 10.244.0.0/16 |  | Required. Specifies the CIDR notation IP range from which to assign pod IPs when kubenet is used. |
| `aksClusterServiceCidr` | string | 10.2.0.0/16 |  | Required. A CIDR notation IP range from which to assign service cluster IPs. It must not overlap with any Subnet IP ranges. |
| `aksClusterSkuTier` | string | Paid | System.Object[] | Required. Specifies the tier of a managed cluster SKU: Paid or Free |
| `aksClusterSshPublicKey` | string |  |  | Optional. Specifies the SSH RSA public key string for the Linux nodes. |
| `autoScalerProfileMaxGracefulTerminationSec` | string | 600 |  | Optional. Specifies the max graceful termination time interval in seconds for the auto-scaler of the AKS cluster. |
| `autoScalerProfileScaleDownDelayAfterAdd` | string | 10m |  | Optional. Specifies the scale down delay after add of the auto-scaler of the AKS cluster. |
| `autoScalerProfileScaleDownDelayAfterDelete` | string | 20s |  | Optional. Specifies the scale down delay after delete of the auto-scaler of the AKS cluster. |
| `autoScalerProfileScaleDownDelayAfterFailure` | string | 3m |  | Optional. Specifies scale down delay after failure of the auto-scaler of the AKS cluster. |
| `autoScalerProfileScaleDownUnneededTime` | string | 10m |  | Optional. Specifies the scale down unneeded time of the auto-scaler of the AKS cluster. |
| `autoScalerProfileScaleDownUnreadyTime` | string | 20m |  | Optional. Specifies the scale down unready time of the auto-scaler of the AKS cluster. |
| `autoScalerProfileScanInterval` | string | 10s |  | Optional. Specifies the scan interval of the auto-scaler of the AKS cluster. |
| `autoScalerProfileUtilizationThreshold` | string | 0.5 |  | Optional. Specifies the utilization threshold of the auto-scaler of the AKS cluster. |
| `azurePolicyEnabled` | bool | True |  | Optional. Specifies whether the azurepolicy add-on is enabled or not. |
| `azurePolicyVersion` | string | v2 |  | Optional. Specifies the azure policy version to use. |
| `clientAppID` | string | "" |  | Optional. The client AAD application ID. |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered |
| `diagnosticLogsRetentionInDays` | int | 365 |  | Optional. Specifies the number of days that logs will be kept for; a value of 0 will retain data indefinitely. |
| `diagnosticSettingsName` | String | DiagnosticSettings |  | Optional. Resource identifier of the Diagnostic Storage Account. |
| `diagnosticStorageAccountId` | string |  |  | Optional. Resource identifier of the Diagnostic Storage Account. |
| `eventHubAuthorizationRuleId` | string |  |  | Optional. Resource ID of the event hub authorization rule for the Event Hubs namespace in which the event hub should be created or streamed to. |
| `eventHubName` | string |  |  | Optional. Name of the event hub within the namespace to which logs are streamed. Without this, an event hub is created for each log category. |
| `httpApplicationRoutingEnabled` | bool | False |  | Required. Specifies whether the httpApplicationRouting add-on is enabled or not. |
| `identity` | object | null |  | Optional. The identity of the managed cluster. |
| `kubeDashboardEnabled` | bool | False |  | Optional. Specifies whether the kubeDashboard add-on is enabled or not. |
| `location` | string | [resourceGroup().location] |  | Required. Specifies the location of AKS cluster. It picks up Resource Group's location by default. |
| `lockForDeletion` | bool | False |  | Optional. Switch to lock Key Vault from deletion. |
| `managedOutboundIPCount` | int | 0 |  | Optional. Outbound IP Count for the Load balancer. |
| `omsAgentEnabled` | bool | True |  | Optional. Specifies whether the OMS agent is enabled. |
| `primaryAgentPool` | object |  |  | Required. Define the primary host pool |
| `roleAssignments` | array | System.Object[] |  | Optional. Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11' |
| `serverAppID` | string | "" |  | Optional. The server AAD application ID. |
| `serverAppSecret` | string | "" |  | Optional. The server AAD application secret. |
| `tags` | object |  |  | Optional. Tags of the resource. |
| `workspaceId` | string |  |  | Optional. Resource identifier of Log Analytics. |

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

### Parameter Usage: `primaryAgentPool`

Provide values for primary agent pool as needed. 
The primaryAgentValue parameter should be provided.

```json
"primaryAgentPool": {
      "value": {
        "name": "systempool1",
        "vmSize": "Standard_DS3_v2",
        "osDiskSizeGB": 128,
        "count": 2,
        "osType": "Linux",
        "maxCount": 5,
        "minCount": 1,
        "enableAutoScaling": true,
        "scaleSetPriority": "Regular",
        "scaleSetEvictionPolicy": "Delete",
        "nodeLabels": {},
        "nodeTaints": [
          "CriticalAddonsOnly=true:NoSchedule"
        ],
        "type": "VirtualMachineScaleSets",
        "availabilityZones": [
          "1",
          "2",
          "3"
        ],
        "maxPods": 30,
        "storageProfile": "ManagedDisks",
        "mode": "System",
        "vnetSubnetID": "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/myRg/providers/Microsoft.Network/virtualNetworks/myVnet/subnets/mySubnet",
        "tags": {
          "Owner": "abc.def@contoso.com",
          "BusinessUnit": "IaCs",
          "Environment": "PROD",
          "Region": "USEast"
        }
      }
    }
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `azureKubernetesServiceName` | string | The Name of the Azure Kubernetes Service. |
| `azureKubernetesServiceResourceGroup` | string | The name of the Resource Group the Azure Kubernetes Service was created in. |
| `azureKubernetesServiceResourceId` | string | The Resource Id of the Azure Kubernetes Service. |
| `controlPlaneFQDN` | string | The FQDN of the Azure Kubernetes Service. |

## Considerations

- *None*

## Additional resources

- [Use tags to organize your Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-using-tags)
- [Azure Resource Manager template reference](https://docs.microsoft.com/en-us/azure/templates/)
- [ManagedClusters](https://docs.microsoft.com/en-us/azure/templates/Microsoft.ContainerService/2020-11-01/managedClusters)
- [ManagedClusters/providers/diagnosticsettings](https://docs.microsoft.com/en-us/azure/templates/Microsoft.ContainerService/2017-05-01-preview/managedClusters/providers/diagnosticsettings)
- [Deployments](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Resources/2020-06-01/deployments)