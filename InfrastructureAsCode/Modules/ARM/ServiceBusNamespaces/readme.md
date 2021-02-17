# ServiceBusNamespaces

This module deploys Service Bus Namespace resource.

## Resource types

| Resource Type | Api Version |
| :-- | :-- |
| `Microsoft.Resources/deployments` | 2020-06-01 |
| `Microsoft.ServiceBus/namespaces/AuthorizationRules` | 2017-04-01 |
| `Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs` | 2017-04-01 |
| `Microsoft.ServiceBus/namespaces/ipFilterRules` | 2018-01-01-preview |
| `Microsoft.ServiceBus/namespaces/migrationConfigurations` | 2017-04-01 |
| `Microsoft.ServiceBus/namespaces/virtualNetworkRules` | 2018-01-01-preview |
| `Microsoft.ServiceBus/namespaces/providers/diagnosticsettings` | 2017-05-01-preview |
| `Microsoft.ServiceBus/namespaces/providers/roleAssignments` | 2018-09-01-preview |
| `Microsoft.ServiceBus/namespaces` | 2018-01-01-preview |
| `providers/locks` | 2016-09-01 |

## Parameters

| Parameter Name                | Type         | Default Value                                       | Possible values               | Description                                                                                                        |
| :--| :--| :-| :--| :----------------------------------------------------------------------------------------------------------------- |
| `serviceBusNamespaceName`| string | | | Required. Name of the Service Bus Namespace|
| `location`| string | | | Required. The Geo-location where the resource lives. | |
| `skuName`| string | | | Required. Name of this SKU. - Basic, Standard, Premium. | Basic, Standard, Premium |
| `zoneRedundant`| string | | | Optional. Enabling this property creates a Premium Service Bus Namespace in regions supported availability zones. | |
| `partnerNamespaceId` | string | Optional. ARM Id of the Primary/Secondary Service Bus namespace name, which is part of GEO DR pairing. |  |  |
| `namespaceAlias` | string | Optional. The Disaster Recovery configuration name. |  |  |
| `authorizationRules` | array | Optional. Authorization Rules for the Event Hub namespace. | System.Object[] |  |
| `ipFilterRules` | array | Optional. IP Filter Rules for the Service Bus namespace (requires Premium sku). | System.Object[] |  |
| `targetNamespace` | string | Optional. Existing premium Namespace ARM Id name which has no entities, will be used for migration. |  |  |
| `postMigrationName` | string | Optional. Name to access Standard Namespace after migration. |  |  |
| `virtualNetworkRuleSubnetIds` | array | Optional. vNet Rules SubnetIds for the Service Bus namespace. | System.Object[] |  |
| `diagnosticLogsRetentionInDays` | int | Optional. Specifies the number of days that logs will be kept for; a value of 0 will retain data indefinitely. | 365 |  |
| `diagnosticStorageAccountId` | string | Optional. Resource identifier of the Diagnostic Storage Account. |  |  |
| `workspaceId` | string | Optional. Resource identifier of Log Analytics. |  |  |
| `eventHubAuthorizationRuleId` | string | "" | | Optional. Resource ID of the event hub authorization rule for the Event Hubs namespace in which the event hub should be created or streamed to.
| `eventHubName` | string | "" | | Optional. Name of the event hub within the namespace to which logs are streamed. Without this, an event hub is created for each log category.
| `lockForDeletion`| bool | | | Optional. Flag indicating if resource is locked for deletion. | |
| `roleAssignments` | array | Optional. Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11' | System.Object[] |  |
| `tags`| string | | | Optional. Tag names and tag values can be provided as needed (see below) | |
| `cuaId`| string | | | Customer Usage Attribution id (GUID). This GUID must be previously registered | |

### Parameter Usage: `authorizationRules`

Default value:

```json
"authorizationRules": {
    "value": [
        {
            "name": "RootManageSharedAccessKey",
            "properties": {
                "rights": [
                    "Listen",
                    "Manage",
                    "Send"
                ]
            }
        }
    ]
}
```

### Parameter Usage: `ipFilterRules`

```json
"ipFilterRules": {
    "value": [
        {
            "filterName": "ipFilter1",
            "ipMask": "10.0.1.0/32",
            "action": "Accept"
        },
        {
            "filterName": "ipFilter2",
            "ipMask": "10.0.2.0/32",
            "action": "Deny"
        }
    ]
}
```

### Parameter Usage: `virtualNetworkRuleSubnetIds`

```json
"virtualNetworkRuleSubnetIds": {
    "value": [
        "/subscriptions/<subscription-id>/resourceGroups/resourceGroup/providers/Microsoft.Network/virtualNetworks/<vnet-name>/subnets/<subnet-name>",
        "/subscriptions/<subscription-id>/resourceGroups/resourceGroup/providers/Microsoft.Network/virtualNetworks/<vnet-name>/subnets/<subnet-name>"
    ]
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
| `defaultAuthorizationRuleId` | string | The Id of the authorization rule marked by the variable with the same name. |
| `serviceBusConnectionString` | string | The Service Bus Namespace connection string. |
| `serviceBusNamespaceName` | string | The Name of the Service Bus Namespace. |
| `serviceBusNamespaceResourceGroup` | string | The name of the Resource Group the Service Bus Namespace was created in. |
| `serviceBusNamespaceResourceId` | string | The Resource Id of the Service Bus Namespace. |

## Considerations

*N/A*

## Additional resources

- [Microsoft.ServiceBus Namespace template reference](https://docs.microsoft.com/en-us/azure/templates/Microsoft.ServiceBus/2018-01-01-preview/namespaces)
- [What is Azure Service Bus?](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview)
- [Use tags to organize your Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-using-tags)