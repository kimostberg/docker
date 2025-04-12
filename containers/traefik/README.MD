install on docker server: 
```
sudo apt install apache2-utils
```
Run command:
```
echo $(htpasswd -nB admin) | sed -e s/\\$/\\$\\$/g
```
copy result to .env-file after TRAEFIK_DASHBOARD_CREDENTIALS=