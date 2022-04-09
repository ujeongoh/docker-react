# Build Phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
# Instead of  [COPY . .], Use Docker volume but it's recommended to leave COPY
COPY . .
RUN npm run build

# app/build <-- all we want for build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
