# PHASE 0
# named builders will fail with AWS 10-02-2020
# FROM node:alpine as builder

# unnamed builder however works
FROM node:alpine

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# PHASE 1
FROM nginx
EXPOSE 80

# named builders will fail with AWS 10-02-2020
# COPY --from=builder /app/build /usr/share/nginx/html

# unnamed builder however works
COPY --from=0 /app/build /usr/share/nginx/html