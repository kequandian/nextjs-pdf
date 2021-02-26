# FROM node:12.18-alpine
FROM daocloud.io/library/node:12
ENV NODE_ENV=production
WORKDIR /usr/src/app
# Downloading https://github.com/Medium/phantomjs/releases/download/v2.1.1/phantomjs-2.1.1-linux-x86_64.tar.bz2
COPY ./phantomjs-2.1.1-linux-x86_64.tar.bz2 /tmp/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2
# #
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# RUN npm install --production --silent && mv node_modules ../
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]
