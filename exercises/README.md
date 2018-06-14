pvcreate /dev/xvdg /dev/xvdh /dev/xvdi /dev/xvdj /dev/xvdk
pvdisplay
vgcreate volGroupPSTData /dev/xvdg /dev/xvdh /dev/xvdi /dev/xvdj /dev/xvdk
vgdisplay
lvcreate --name data1 --size 498G volGroupPSTData
lvdisplay
mkfs.ext4 /dev/volGroupPSTData/data1
mkdir /data1
mount -t ext4 /dev/volGroupPSTData/data1 /data1
df -h
[root@aosprd3-pst01 ec2-user]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/xvda1             20G  3.6G   16G  19% /
tmpfs                 3.9G     0  3.9G   0% /dev/shm
/dev/xvdf1             99G   60M   94G   1% /data
/dev/mapper/volGroupPSTData-data1
                      491G   70M  466G   1% /data1

		      /etc/fstab
		      /dev/volGroupPSTData/data1 /data1       ext4    defaults        0 0
