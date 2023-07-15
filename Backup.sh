# https://tonyteaches.tech/rsync-backup-tutorial/
# https://www.youtube.com/watch?v=z35ZPELo5_Y

# Daily Backup
tar -zcf /home/tony/backup/daily/backup-$(date +%Y%m%d).tar.gz -C /var/www/ html
find /home/tony/backup/daily/* -mtime +7 -delete

# Weekly Backup
tar -zcf /home/tony/backup/weekly/backup-$(date +%Y%m%d).tar.gz -C /var/www/ html
find /home/tony/backup/weekly/* -mtime +31 -delete

# Monthly Backup
tar -zcf /home/tony/backup/monthly/backup-$(date +%Y%m%d).tar.gz -C /var/www/ html
find /home/tony/backup/monthly/* -mtime +365 -delete

# Automate with Cron
$ crontab -e

15 0 * * * sh /home/tony/backup-daily.sh
30 0 * * 1 sh /home/tony/backup-weekly.sh
45 0 1 * * sh /home/tony/backup-monthly.sh