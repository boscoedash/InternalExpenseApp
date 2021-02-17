# VirtualNetworkPeering

This template deploys Virtual Network Peering.


## Resource types

|Resource Type|ApiVersion|
|:--|:--|
|`Microsoft.Network/virtualNetworks/virtualNetworkPeerings`|2019-09-01|
|`Microsoft.Resources/deployments`|2020-06-01|

## Parameters

| Parameter Name | Type | Description | DefaultValue | Possible values |
| :-- | :-- | :-- | :-- | :-- |
| `allowForwardedTraffic` | bool | Optional. Whether the forwarded traffic from the VMs in the local virtual network will be allowed/disallowed in remote virtual network. | True |  |
| `allowGatewayTransit` | bool | Optional. If gateway links can be used in remote virtual networking to link to this virtual network. | False |  |
| `allowVirtualNetworkAccess` | bool | Optional. Whether the VMs in the local virtual network space would be able to access the VMs in remote virtual network space. | True |  |
| `localVnetName` | string | Required. The Name of the Virtual Network to add the peering to. |  |  |
| `location` | string | Optional. Location for all resources. | [resourceGroup().location] |  |
| `peeringName` | string | Required. The Name of the virtual network peering resource. |  |  |
| `remoteVirtualNetworkId` | string | Required. The Resource Id of the remote virtual network. The remove virtual network can be in the same or different region. |  |  |
| `useRemoteGateways` | bool | Optional. If remote gateways can be used on this virtual network. If the flag is set to true, and allowGatewayTransit on remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. | True |  |
| `cuaId` | string | Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered |  |  |

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `vNetPeeringName` | string | The Name of the vNet Peering. |
| `vNetPeeringResourceId` | string | The Resource Id of the vNet Peering. |
| `vNetPeeringResourceResourceGroup` | string | The Resource Group the vNet Peering was deployed to. |

## Considerations

N/A

## Additional resources

- [Microsoft.Network virtualNetworks/virtualNetworkPeerings template reference](https://docs.microsoft.com/en-us/azure/templates/microsoft.network/2019-04-01/virtualnetworks/virtualnetworkpeerings)
