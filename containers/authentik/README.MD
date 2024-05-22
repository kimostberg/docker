Create password and secret key

```
echo "PG_PASS=$(openssl rand 36 | base64)" >> .env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand 60 | base64)" >> .env
```