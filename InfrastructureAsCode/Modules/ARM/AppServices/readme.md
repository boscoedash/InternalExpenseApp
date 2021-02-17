# App Services


## Resource types

|Resource Type| Api Version|
|:--|:--|
|`Microsoft.Resources/deployments`|2018-02-01|
|`Microsoft.Web/serverfarms`|2018-02-01|
|`Microsoft.Web/sites`	|2018-02-01|
|`providers/locks`	|2016-09-01|
|`Microsoft.Web/sites/providers/diagnosticsettings`|2017-05-01-preview|


### Resource dependency

The following resources are required to be able to deploy this resource.

## Parameters

| Parameter Name | Type | Description | DefaultValue | Allowed Values |
| :-- | :-- | :-- | :-- | :-- |
| `cuaId` | string | Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered |  |  |
| `diagnosticLogsRetentionInDays` | int | Optional. Specifies the number of days that logs will be kept for; a value of 0 will retain data indefinitely. | 365 |  |
| `diagnosticStorageAccountId` | string | Optional. Resource identifier of the Diagnostic Storage Account. |  |  |
| `eventHubAuthorizationRuleId` | string | Optional. Resource ID of the event hub authorization rule for the Event Hubs namespace in which the event hub should be created or streamed to. |  |  |
| `eventHubName` | string | Optional. Name of the event hub within the namespace to which logs are streamed. Without this, an event hub is created for each log category. |  |  |
| `hostingPlanName` | string | Required. Name of the Application Service Plan |  |  |
| `location` | string | Optional. Location for all Resources. | [resourceGroup().location] |  |
| `lockForDeletion` | bool | Optional. Switch to lock Key Vault from deletion. | False |  |
| `sku` | string | Optional. The pricing tier for the hosting plan. | F1 |  |
| `tags` | object | Optional. Tags of the resource. |  |  |
| `webAppPortalName` | string | Required. Name of the Web Application Portal Name |  |  |
| `workerSize` | int | Optional. Defines the number of workers from the worker pool that will be used by the app service plan | 2 |  |
| `workspaceId` | string | Optional. Resource identifier of Log Analytics. |  |  |

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
| `appServiceName` | string | The Name of the Application Web Services |
| `appServiceResourceGroup` | string | The name of the Resource Group with the Application Web Services |
| `appServiceResourceId` | string | The Resource Id of the Application Web Services |

### References

### Template references

- [Deployments](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Resources/2018-02-01/deployments)
- [ServerfarmS](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Web/2018-02-01/serverfarms)
- [SiteS](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Web/2018-02-01/sites)

## Considerations

## Additional resources

- [Deployments](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Resources/2018-02-01/deployments)
- [ServerfarmS](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Web/2018-02-01/serverfarms)
- [SiteS](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Web/2018-02-01/sites)
