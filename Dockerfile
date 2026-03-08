FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Notice: NO "ENV REDIS_URL=..." here!
EXPOSE 3000
CMD ["npm", "start"]
