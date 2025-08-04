FROM node:18
WORKDIR /app
COPY app/ ./app/
COPY package*.json ./
RUN npm install
CMD ["node", "app/index.js"]
