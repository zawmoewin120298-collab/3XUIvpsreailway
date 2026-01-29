FROM ghcr.io/mhsanaei/3x-ui:latest

# လိုအပ်သော TOOLS များ သွင်းခြင်း
RUN apk update && apk add --no-cache curl bash

# CLOUDFLARED INSTALLATION
RUN curl -L https://github.com/cloudflare/cloudflare-linux-amd64.bin -o /usr/local/bin/cloudflared \
    && chmod +x /usr/local/bin/cloudflared

# RAILWAY VARIABLES မှ PORT များကို EXPOSE လုပ်ခြင်း
EXPOSE 2053
EXPOSE 443
EXPOSE 80
EXPOSE 8080

# TUNNEL နှင့် PANEL ကို တစ်ပြိုင်နက် မောင်းနှင်ခြင်း
# ဆရာ့ရဲ့ TOKEN ကို ဒီမှာ အောက်ပါအတိုင်း ထည့်ပေးပါ
CMD ["/bin/sh", "-c", "/usr/local/bin/cloudflared tunnel --no-autoupdate run --token eyJhIjoiNTBlNjY3NDA4YTBjMWQ1MmVmNTBhZmIyNGViNmViOGEiLCJ0IjoiODc0ZmFkYmUtOTZhNS00OGZkLTlkMGUtNzE5NDdkYzE0Zjg0IiwicyI6Ik56VmtNR0ptWm1JdE56RXpNaTAwTWpBNExXSmxOak10WVRBek1qUXhZMk0xTlRFeSJ9 & sleep 5 && /app/x-ui"]
