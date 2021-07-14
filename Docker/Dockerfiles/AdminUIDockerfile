# Admin UI Multi-Stage Build Dockerfile

# Stage 1 - Build Project
FROM node:14-alpine as build-step
WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build -- --deploy-url=/ --configuration production

# Stage 2 - Host using Nginx (Accounts for Routing)
FROM nginx:1.17.1-alpine
COPY ./nginx.conf /etc/nginx/nginx.conf
# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build-step /app/dist/admin-ui/ /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]
