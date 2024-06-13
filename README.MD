This will install docker and compose. It will add current user to docker group
```
wget -qO- https://raw.githubusercontent.com/kimostberg/docker/main/install_docker.sh | bash
```

This will ask for username and password. Then it will add user to sudo and docker groups
```
wget https://raw.githubusercontent.com/kimostberg/docker/main/create_user.sh
chmod +x create_user.sh
./create_user.sh
```

This is backup script for docker. By default it will create look for compose.yml files from /docker subfolders. When it finds the file it will shutdown container, copy whole folder to /backup and then start containers again. 
If you run commands below, it will download the backup script to /docker and schedule it to run every night at 1:00
```
cd /docker
wget https://raw.githubusercontent.com/kimostberg/docker/main/backup.sh
chmod +x backup.sh
sudo crontab -l > addbackup2cron
sudo echo 0 1 * * * /docker/backup.sh >> addbackup2cron
sudo crontab addbackup2cron
sudo rm addbackup2cron

```
