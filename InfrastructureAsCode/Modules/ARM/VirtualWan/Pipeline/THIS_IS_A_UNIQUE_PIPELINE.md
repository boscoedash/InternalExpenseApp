# Background

- Virtual WAN requires a custom removal step, which removes related resources (like VirtualHub, VPNGateway, VPNSite) before removing the VirtualWAN itself.
  | File | Description |
  | - | - |
  | `pipeline.jobs.remove.VirtualWAN.yml` | Customized removal stage for VirtualWAN |
  