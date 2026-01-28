FROM ghcr.io/mhsanaei/3x-ui:latest

# လိုအပ်သော Tools များ သွင်းခြင်း
RUN apk update && apk add --no-cache curl bash

# Railway Variables မှ Port ကို အသုံးပြုရန် (Port 2053)
EXPOSE 2053

# 3x-ui ကို တိုက်ရိုက် Run ခြင်း
CMD ["/app/x-ui"]
