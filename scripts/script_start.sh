!/bin/sh
# Deploy keys to allow all nodes to connect each others as root
#mkdir /root/.ssh/
mkdir -p /home/gestsvcansible/.ssh/
#mv /tmp/id_rsa*  /root/.ssh/
cp /root/.ssh/id_rsa_gestsvcansible.pub /home/gestsvcansible/.ssh/

#chmod 400 /root/.ssh/id_rsa*
chmod 400 /home/gestsvcansible/.ssh/id_rsa*
#chown root:root  /root/.ssh/id_rsa*
chown gestsvcansible:gestsvcansible /home/gestsvcansible/.ssh/id_rsa*

#cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
cat /home/gestsvcansible/.ssh/id_rsa_gestsvcansible.pub >> /home/gestsvcansible/.ssh/authorized_keys
#chmod 400 /root/.ssh/authorized_keys
chmod 400 /home/gestsvcansible/.ssh/authorized_keys
#chown root:root /root/.ssh/authorized_keys
chown gestsvcansible:gestsvcansible /home/gestsvcansible/.ssh/authorized_keys

# Install updates and curl
apt update -y
apt install -y curl wget
# Apt cleanup.
apt autoremove -y
apt update -y

#  Blank netplan machine-id (DUID) so machines get unique ID generated on boot.
truncate -s 0 /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

## add vagrant to sudo
echo "sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers