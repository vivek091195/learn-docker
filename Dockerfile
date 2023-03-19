FROM node:16-alpine AS build-prod-conf

WORKDIR /usr/app

COPY ./ ./

RUN npm install

RUN ["npm", "run", "build"]


FROM nginx 

COPY --from=build-prod-conf /usr/app/build /usr/share/nginx/html
