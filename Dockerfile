FROM node:alpine
COPY ./hello.js /
CMD [ "node", "hello.js" ]