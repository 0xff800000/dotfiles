# Memo of commands

## File share

### rsync

Copy files from distant machine to local

```bash
rsync -zavh . pi@192.168.1.123:/opt/backup
```

Copy files from local machine to distant

```bash
rsync -zavh pi@192.168.1.123:/opt/backup .
```

## Disk storage

### ntfsfix

Sometimes the ntfs partitions might be stuck in read-only mode while being and always busy when unmounting.
This could fix it :

```bash
sudo ntfsfix /dev/sdb1                                                                                                                             127 ↵
```

