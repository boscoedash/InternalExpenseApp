# Background

- The Azure NetApp files services requires a custom removal step, which removes sub resources in order (like Volumnes, Pools) before removing the NetApp Account itself.
  | File | Description |
  | - | - |
  | `pipeline.jobs.remove.netapp.yml` | Customized removal stage for AzureNetAppFiles |
  