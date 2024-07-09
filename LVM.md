```markdown
# LVM Cheat Sheet

## 1. List All Volume Groups

```bash
vgs
```

| Command | Description            |
|---------|------------------------|
| `vgs`   | Lists all volume groups |

---

## 2. List All Logical Volumes

```bash
lvs
```

| Command | Description              |
|---------|--------------------------|
| `lvs`   | Lists all logical volumes |

---

## 3. List All Physical Volumes

```bash
pvs
```

| Command | Description                |
|---------|----------------------------|
| `pvs`   | Lists all physical volumes |

---

## 4. Display Detailed Information About a Specific Volume Group

```bash
vgdisplay <volume_group_name>
```

| Command                            | Description                                      |
|------------------------------------|--------------------------------------------------|
| `vgdisplay <vg_name>`             | Detailed info about the specified volume group |

---

## 5. Display Detailed Information About a Specific Logical Volume

```bash
lvdisplay <volume_group_name>/<logical_volume_name>
```

| Command                                      | Description                                         |
|----------------------------------------------|-----------------------------------------------------|
| `lvdisplay <vg_name>/<lv_name>`           | Detailed info about the specified logical volume  |

---

## 6. Show Detailed LVM Configuration

```bash
lvm config
```

| Command       | Description                           |
|---------------|---------------------------------------|
| `lvm config` | Shows LVM configuration details       |

---

## Example Commands

| Command                                        | Description                                       |
|------------------------------------------------|---------------------------------------------------|
| `vgs`                                           | List volume groups                               |
| `lvs`                                           | List logical volumes                             |
| `pvs`                                           | List physical volumes                            |
| `vgdisplay my-vg`                              | Detailed info about volume group `my-vg`         |
| `lvdisplay my-vg/my-lv`                        | Detailed info about logical volume `my-lv`       |
| `lvm config`                                    | Show LVM configuration details                   |

---

You can use this cheat sheet to quickly find the commands you need for managing LVM on Proxmox.
```

You can copy and paste this Markdown into your notes or documentation for easy reference.