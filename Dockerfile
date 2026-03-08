FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# 1. Use a standard Node image (avoid 'alpine' as it lacks tools)
FROM node:20

# 2. Set the working directory
WORKDIR /app

# 3. INSTALL GIT (This fixes the ENOENT error)
RUN apt-get update && apt-get install -y git

# 4. Copy package files and install
COPY package*.json ./
RUN npm install

# 5. Copy the rest of your code

# 6. Start the app
EXPOSE 3000
CMD ["npm", "start"]
# Notice: NO "ENV REDIS_URL=..." here!
