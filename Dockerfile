FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

# creates a build folder in /app/ direcctory 
RUN npm run build

# to end one phase and start another, you can just type FROM again.

FROM nginx

# This is NOT used on local workstaton testing and has no affect
# This IS used in prod deployments and in AWS Deployments
# AWS BeanStalk will read this and open up port 80 to public
EXPOSE 80  

COPY --from=builder /app/build /usr/share/nginx/html 

# default behavior of nginx container is to start nginx automaticly
