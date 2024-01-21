# syntax=docker/dockerfile:1

ARG NODE_VERSION=20.11.0
ARG NGINX_VERSION=1.25.3

FROM node:$NODE_VERSION-alpine AS base
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .

# Use this stage in compose file for development environment
FROM base AS development
EXPOSE 3000
CMD [ "npm", "start" ]

FROM base AS production-build
RUN npm run build

# Use this stage in compose file for production environment
FROM nginxinc/nginx-unprivileged:$NGINX_VERSION-alpine AS production
COPY --from=production-build /app/build /usr/share/nginx/html
EXPOSE 8080
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
