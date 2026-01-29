FROM ghcr.io/mhsanaei/3x-ui:latest

# လိုအပ်သော TOOLS များ သွင်းခြင်း
RUN apk update && apk add --no-cache curl bash

# PORT များကို EXPOSE လုပ်ခြင်း (Panel အတွက် ၂၀၅၃ နှင့် VPN အတွက် ၄၄၃/၈၀)
EXPOSE 2053
EXPOSE 443
EXPOSE 80

# PANEL ကို တိုက်ရိုက် မောင်းနှင်ခြင်း
CMD ["/app/x-ui"]
