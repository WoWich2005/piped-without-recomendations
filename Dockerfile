FROM node:lts-alpine

ENV VITE_PIPED_API=
ENV VITE_PIPED_PROXY=
ENV VITE_PIPED_INSTANCES=

WORKDIR /app/

RUN apk add --no-cache curl

RUN corepack enable && corepack prepare pnpm@latest --activate

COPY package.json package-lock.json pnpm-lock.yaml ./
RUN pnpm install --prefer-offline

COPY . .
CMD [ "pnpm", "build" ]