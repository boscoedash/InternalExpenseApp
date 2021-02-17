# Application Insights

## Resource Types

| Resource Type | Api Version |
| :-- | :-- |
| `Microsoft.Resources/deployments` | 2020-06-01 |
| `Microsoft.Insights/components` | 2018-05-01-preview |



### Resource dependency

The following resources are required to be able to deploy this resource.

## Parameters

| Parameter Name | Type | Description | DefaultValue | Possible values |
| :-- | :-- | :-- | :-- | :-- |
| `appInsightsName` | string | Required. Name of the Application Insights |  |  |
| `appInsightsType` | string | Optional. Application type | web | System.Object[] |
| `cuaId` | string | Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered |  |  |
| `location` | string | Optional. Location for all Resources | [resourceGroup().location] |  |
| `tags` | object | Optional. Tags of the resource. |  |  |

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
| `appInsightsAppId` | string | Application Insights Application Id |
| `appInsightsKey` | string | Application Insights Resource Instrumentation Key |
| `appInsightsName` | string | Application Insights Resource Name |
| `appInsightsResourceGroup` | string | Application Insights ResourceGroup |
| `appInsightsResourceId` | string | Application Insights Resource Id |

### References

### Template references

- [Deployments](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Resources/2018-02-01/deployments)
- [Components](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Insights/[variables('appInsightsApiVersion')]/components)

## Considerations

## Additional resources

- [Deployments](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Resources/2018-02-01/deployments)
- [Components](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Insights/[variables('appInsightsApiVersion')]/components)