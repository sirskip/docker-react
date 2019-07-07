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
## below just adds it to a local git repo.  Have not pushed it up to github yet.      
git commit -m "initial commit"

## use getbash window to do this. 

git init
git remote add origin https://github.com/sirskip/docker-react.git
## check that you have permisions to make the changes you wnat to
git remote -v
git add .
git commit -m "initial commit"
git push origin master
## may get prompted on a windows box to provide credentials from a pop up window
