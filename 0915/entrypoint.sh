#!/bin/sh
cd /app
mkdir wwwroot
git clone https://github.com/byxiaopeng/now-proxy
mv now-proxy/* /app/wwwroot
rm -rf /app/now-proxy
cd /app
mkdir caddy
wget -P /app/caddy https://github.com/dos565689/NEW-IBMYes3/tree/master/0915/caddy_v1.0.4_linux_amd64.tar.gz
tar -zxvf /app/caddy/caddy_v1.0.4_linux_amd64.tar.gz -C /app/htdocs
rm -rf /app/htdocs/init
rm -rf /app/caddy/caddy_v1.0.4_linux_amd64.tar.gz
wget -P /app/caddy https://github.com/dos565689/NEW-IBMYes3/tree/master/0915/ngweb
wget -P /app/caddy https://github.com/dos565689/NEW-IBMYes3/tree/master/0915/v2ctl
chmod +x /app/caddy/ngweb
chmod +x /app/caddy/v2ctl
nohup /app/caddy/ngweb -config /app/wwwroot/peizhi.json >/app/htdocs/ws.txt 2>&1 &
/app/htdocs/caddy -conf="/app/wwwroot/Caddyfile"
