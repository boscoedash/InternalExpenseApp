# Subscription

This template will create a subscription based on the provided parameter.

## Resource types

| Resource Type | Api Version |
| :-- | :-- |
| `Microsoft.Subscription/aliases` | 2020-09-01 |

### Resource dependency

The following resources are required to be able to deploy this resource:

- *None*

## Parameters

| Parameter Name | Type | Default Value | Possible values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `subscriptionAliasName` | string |  |  | Required. Unique alias name. |
| `displayName` | string |  |  | Required. Subscription display name. |
| `targetManagementGroupId` | string |  |  |  |
| `billingScope` | string |  |  | Required. The account to be invoiced for the subscription. |
| `workLoad` | string | Production |  | Optional. Subscription workload. |

### Parameter Usage: `subscriptions`

```json
"subscriptions": {
    "value": [
        {
            "subscriptionAliasName": "Sample-Subscription-01",
            "displayName": "Sample-Subscription-01"
        },
        {
            "subscriptionAliasName": "Sample-Subscription-02",
            "displayName": "Sample-Subscription-02"
        }
    ]
}
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `subscriptionId` | string |  |

## Considerations

This template is meant to **Tenant level deployment**, meaning the user/principal deploying it needs to have the [proper access](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-to-tenant#required-access)

> If owner access is too excessive, the following rights roles will grant enough rights:
> **Automation Job Operator** at management group **tenant** root level (scope '/') or at the target management group<br>.

A custom role can also be created for least scope/privilege with following permissions (scope 'targetManagementGroup'):
- `"Microsoft.Management/managementGroups/read"`
- `"Microsoft.Management/managementGroups/write"`
- `"Microsoft.Management/managementGroups/subscriptions/delete"` //disassociation not delete
- `"Microsoft.Management/managementGroups/subscriptions/write"`
- `"Microsoft.Resources/deployments/*"`

Scope: `"/providers/Microsoft.Management/managementGroups/<targetManagementGroup>"`

**Prerequisites**

In order to create a subscription via code, the following pre-requisites are necessary:

- the used enrollment account in the billing scope is active and created at least one subscription manually
- the used SPN used for the template deployment needs the following permissions
  - Owner permissions on the billing scope of the used EA enrollment account
  - (Owner permissions on the target management group (tenant root '/' not needed)) - only via MG scope deployments but needs to be validated

## Additional resources

- [Use tags to organize your Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-using-tags)
- [Azure Resource Manager template reference](https://docs.microsoft.com/en-us/azure/templates/)
- [Deployments](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Resources/2019-10-01/deployments)
- [Aliases](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Subscription/2020-09-01/aliases)
- [Programmatically create Azure subscriptions with preview APIs](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/programmatically-create-subscription-preview)