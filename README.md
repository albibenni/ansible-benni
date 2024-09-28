## Redshift
Edit the file /etc/apparmor.d/usr.bin.redshift and change the line

    owner @{HOME}/.config/redshift.conf r,

To

    owner @{HOME}/.config/redshift/* r,


Then restart apparmor: sudo systemctl restart apparmor
