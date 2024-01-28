# syntax=docker/dockerfile:1

ARG NODE_VERSION=21.6.0

FROM node:$NODE_VERSION-alpine AS base
WORKDIR /app
COPY package*.json ./

# Use this stage in compose file for development environment
FROM base AS development
RUN npm install
COPY . .
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "./docker-entrypoint.sh" ]
EXPOSE 3001
CMD [ "npm", "start" ]

# Use this stage in compose file for production environment
FROM base AS production
RUN npm install --production
COPY . .
RUN chmod +x docker-entrypoint.sh && \
  addgroup api && \
  adduser -S -G api api && \
  chown api:api node_modules/.cache
USER api
ENTRYPOINT [ "./docker-entrypoint.sh" ]
EXPOSE 3001
CMD [ "npm", "start" ]
