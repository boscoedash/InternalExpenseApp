# ContainerRegistry

Azure Container Registry is a managed, private Docker registry service based on the open-source Docker Registry 2.0. Create and maintain Azure container registries to store and manage your private Docker container images and related artifacts.

## Resource types

| Resource Type | Api Version |
| :-- | :-- |
| `Microsoft.Resources/deployments` | 2020-06-01 |
| `Microsoft.ContainerRegistry/registries` | 2019-05-01 |
| `Microsoft.ContainerRegistry/registries/providers/roleAssignments` | 2020-04-01-preview |
| `providers/locks` | 2016-09-01 |

## Parameters

| Parameter Name | Type | Description | DefaultValue | Allowed Values |
| :-- | :-- | :-- | :-- | :-- |
| `acrName` | string | Required. Name of the container registry. |  |  |
| `acrAdminUserEnabled` | bool | Required. The value that indicates whether the admin user is enabled. | false | true false |
| `location` | string | Optional. Location for all Resources. | [resourceGroup().location] |  |
| `roleAssignments` | array | Optional. Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11' | System.Object[] |  |
| `acrSku` | enum | Required. The SKU name of the container registry. Required for registry creation. | Basic |  Classic, Basic, Standard, Premium |
| `quarantinePolicyStatus` | string | Optional. The value that indicates whether the policy is enabled or not. |  | Enabled, Disabled |
| `trustPolicyStatus` | string | Optional. The value that indicates whether the policy is enabled or not. |  | Enabled, Disabled |
| `retentionPolicyStatus` | string | Optional. The value that indicates whether the policy is enabled or not.|  | Enabled, Disabled |
| `retentionPolicyDays` | string | Optional. The number of days to retain an untagged manifest after which it gets purged. |  |  |
| `lockForDeletion` | bool | Optional. Switch to lock resource from deletion. | False |  |
| `tags` | object | Optional. Tags of the resource. |  |  |
| `cuaId` | string | Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered |  |  |

### Parameter Usage: `imageRegistryCredentials`

The image registry credentials by which the container group is created from.

```json
    "acrName": {
      "value": {
          "server": "acrx001",
        }
    },
    "acrAdminUserEnabled": {
      "value": false
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
| `acrName` | string | The Name of the Azure Container Registry. |
| `acrLoginServer` | string | The reference to the Azure Container Registry login server. |
| `acrResourceGroup` | string | The name of the Resource Group the Azure Container Registry was created in. |
| `acrResourceId` | string | The Resource Id of the Azure Container Registry. |

## Considerations

## Additional resources

- [Deployments](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Resources/2018-02-01/deployments)
- [ContainerRegistry](https://docs.microsoft.com/en-us/azure/templates/microsoft.containerregistry/2019-05-01/registries)
