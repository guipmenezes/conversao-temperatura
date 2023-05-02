FROM node:16.16.0
RUN apt-get update && apt-get install git -y && apt-get install imagemagick -y;

WORKDIR /app

COPY package*.json ./
COPY . .

RUN npm install
RUN chown -R node:node /app

ENV NODE_ENV=production
ENV ENV_ECS=true
USER root
EXPOSE 8080

CMD ["node", "server.js"]
ENTRYPOINT [ "npm", "start" ]