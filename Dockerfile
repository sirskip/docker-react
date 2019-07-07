FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

# creates a build folder in /app/ direcctory 
RUN npm run build

# to end one phase and start another, you can just type FROM again.

FROM nginx


COPY --from=builder /app/build /usr/share/nginx/html 

# default behavior of nginx container is to start nginx automaticly


#### GITHUB commands
git init
### the . adds everything in directory.  You can add filters to add what ever you want.
git add .      
git commit -m "first commit"


