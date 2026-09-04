## First initialization

Create a dedicated proxmox role

```
pveum role add TerraformProv --privs "VM.Allocate VM.Audit VM.Clone VM.Config.Disk VM.Config.CPU VM.Config.Memory VM.Config.Network VM.Config.Options VM.Config.Cloudinit VM.Config.CDROM VM.Config.HWType VM.PowerMgmt VM.Console VM.Migrate VM.GuestAgent.Audit Datastore.Allocate Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Modify SDN.Use"
```

```
pveum user add terraform-prov@pve
pveum aclmod / -user terraform-prov@pve -role TerraformProv
pveum user token add terraform-prov@pve terraform -expire 0 -privsep 0 -comment "Terraform token"
```
