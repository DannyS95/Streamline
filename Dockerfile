# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /app

# Install compatibility and dependencies
RUN apk update && apk add --no-cache libc6-compat
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve
FROM node:20-alpine
WORKDIR /app

COPY --from=builder /app/.next /app/.next
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/public /app/public

EXPOSE 3000
CMD ["npm", "run", "start"]
