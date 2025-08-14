#!/bin/bash

# روش مطمئن‌تر برای تشخیص کاربر
real_user=$(logname 2>/dev/null || echo "$SUDO_USER")
[ -z "$real_user" ] && real_user=$(id -un)

backup_dir="/home/$real_user/backups"

# ایجاد پوشه با دسترسی صحیح
sudo mkdir -p "$backup_dir"
sudo chown "$real_user:$real_user" "$backup_dir"

# بکاپ از تنظیمات شبکه
sudo tar -czvf "$backup_dir/network_configs_$(date +%Y%m%d).tar.gz" -C / etc/netplan

# لیست کاربران
cut -d: -f1 /etc/passwd > "$backup_dir/users_list.txt"

echo "بکاپ در $backup_dir ذخیره شد!"
