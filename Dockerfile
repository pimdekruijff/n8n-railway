# Node 20 gebruiken, want 18 wordt niet meer ondersteund
FROM node:20-alpine

# n8n versie instellen (nu de nieuwste stabiele)
ARG N8N_VERSION=1.105.4

# Install dependencies
RUN apk add --no-cache graphicsmagick tzdata openssl libc6-compat \
 && apk add --no-cache --virtual .build-deps python3 make g++ \
 && npm_config_user=root npm install --location=global n8n@${N8N_VERSION} \
 && apk del .build-deps

WORKDIR /data

ENV N8N_PORT=5678
ENV PORT=5678
ENV N8N_USER_ID=root
ENV GENERIC_TIMEZONE=Europe/Amsterdam

EXPOSE 5678
CMD ["n8n", "start"]
