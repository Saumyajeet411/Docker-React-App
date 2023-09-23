# Build Phase
FROM node:18-alpine as builder  
# it is referred as builder phase

WORKDIR /usr/frontend

COPY package.json .
RUN npm install

COPY . .
RUN npm run build 
#Build folder will be created in WORKDIR

# Run phase
FROM nginx

# Copy from a other phase
COPY --from=builder /usr/frontend/build /usr/share/nginx/html
# /usr/share/nginx/html -> it is the folder path to run static html page
# default port that nginx uses is 80


