FROM node:alpine as builder
WORKDIR '/myapp'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /myapp/build /usr/share/nginx/html
