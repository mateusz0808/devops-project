# ===== STAGE 1: build =====
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY src ./src
COPY tests ./tests

ENV NODE_ENV=test
RUN npm test

# ===== STAGE 2: runtime =====
FROM node:20-alpine

WORKDIR /app

COPY --from=build /app/package*.json ./
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/src ./src

EXPOSE 3000

CMD ["node", "src/server.js"]
