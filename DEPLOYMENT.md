# Deploying on Ubuntu VM

Here goes the commands to install needed services and certs etc

**Install required packages**

```bash
sudo apt update
sudo apt install docker.io docker-compose

sudo apt install nginx
```

Generate the certificates for

```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d munchora.pro -d www.munchora.pro
```

Add the following to `/etc/nginx/nginx.conf` inside the _http_ section:

```nginx
    server {
        listen 80;
        server_name www.munchora.pro;
        return 301 https://munchora.pro$request_uri;
    }

    server {
        listen 443 ssl http2; # managed by Certbot
        server_name munchora.pro www.munchora.pro;

        # listen [::]:443 ssl ipv6only=on; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/munchora.pro/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/munchora.pro/privkey.pem; # managed by Certbot
        include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

        # Serve uploaded recipe images directly from disk
        location /uploads/ {
            alias /app/public/uploads/;
            access_log off;
            expires 30d;
        }

        location /api {
            proxy_pass http://localhost:9090;
            proxy_set_header Host $host;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "Upgrade";
            proxy_read_timeout 86400s;
            proxy_send_timeout 86400s;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            client_max_body_size 5M;
        }

        location / {
            proxy_pass http://localhost:3001;
            proxy_set_header Host $host;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "Upgrade";
            proxy_read_timeout 86400s;
            proxy_send_timeout 86400s;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
```

When `/etc/nginx/nginx.conf` have been updated _nginx_ have to be restarted to enable new configs:

```bash
# Always check nginx.conf is valid
nginx -t

systemctl restart nginx
```

---

Add the GithubAccess token to be able to pull from GHCR

```bash
echo YOUR_GITHUB_TOKEN | docker login ghcr.io -u realkoder --password-stdin
```

## Working with files

So files are stored in /app/public/uploads which is mounted to `/var/www/munchora/uploads/recipes`

So first create the needed directory at _ubuntu machine_:

```bash
mkdir -p /var/www/munchora/uploads/recipes
```

Run the following to give access rights to docker user

```bash
# First get the user ID
docker exec -it munchora-backend id

# Use the provided user ID
sudo chown -R <uid>:<gid> /var/www/munchora/uploads
sudo chmod -R u+rwX /var/www/munchora/uploads
```


Add this to server part of munchora

```nginx
location /uploads/ {
    alias /var/www/munchora/uploads/;
    access_log off;
    expires 30d;
}
```
