# syntax=docker/dockerfile:1

ARG NODE_VERSION=20.11.0
FROM node:$NODE_VERSION-alpine

# React app lives here
WORKDIR /app

# Set environment variables
ENV MESSAGE="Hello Docker!"

# Install application packages
COPY package*.json .
RUN npm install

# Copy application code
COPY . .

# Add a non-root user and then run and own only
# the runtime files as a non-root user for security
RUN addgroup app && \
  adduser -S -G app app && \
  mkdir node_modules/.cache && \
  chown app:app node_modules/.cache

# Switch to a non-root user
USER app

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["npm", "start"]
