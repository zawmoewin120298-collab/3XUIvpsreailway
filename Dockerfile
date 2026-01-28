FROM ghcr.io/mhsanaei/3x-ui:latest

# လိုအပ်သော Tools များ သွင်းခြင်း
RUN apk update && apk add --no-cache curl bash

# Cloudflared ကို Install လုပ်ခြင်း
RUN curl -L https://github.com/cloudflare/cloudflare-linux-amd64.bin -o /usr/local/bin/cloudflared \
    && chmod +x /usr/local/bin/cloudflared

# Port ဖွင့်ခြင်း (Internal သာဖြစ်သည်)
EXPOSE 2053

# Tunnel နှင့် Panel ကို တစ်ပြိုင်နက် Run ရန်
# <YOUR_TOKEN> နေရာတွင် ဆရာ့ Token ကို အစားထိုးပါ
CMD ["/bin/sh", "-c", "/usr/local/bin/cloudflared tunnel --no-autoupdate run --token <YOUR_TOKEN> & sleep 5 && /app/x-ui"]
