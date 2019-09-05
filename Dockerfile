FROM node:12-alpine AS base
RUN apk update && apk upgrade && \
  apk add --no-cache \
    python g++

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

COPY package.json package-lock.json ./
RUN npm install

COPY . ./

FROM base AS dev
EXPOSE 3000
CMD ["npm", "start"]

FROM base AS server
RUN npm run build

# https://hub.docker.com/_/nginx#hosting-some-simple-static-content
FROM nginx
COPY --from=server /app/build /usr/share/nginx/html
