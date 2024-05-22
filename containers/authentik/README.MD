Create password and secret key

```
echo "PG_PASS=$(openssl rand 36 | base64)" >> .env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand 60 | base64)" >> .env
```

### Configure
To create your first (admin) user, you need to go to your domain at a special address. 

https://authentik.yourdomain.com/if/flow/initial-setup/