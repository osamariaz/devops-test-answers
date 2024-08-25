# Using Official Node Image as Base
FROM node:18-alpine AS base

WORKDIR /usr/src/app

COPY ./package*.json ./

RUN npm install

COPY . .


# Dev
FROM base AS dev
CMD ["node", "index.js"]

# UAT Stage
FROM base AS uat
CMD ["node", "index.js"]

# Prod Stage
FROM base AS prod
CMD ["node", "index.js"]



