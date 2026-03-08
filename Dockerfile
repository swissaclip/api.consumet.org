# 1. Use the full Node.js 20 image to ensure all build tools are available
FROM node:20

# 2. Set the working directory inside the container
WORKDIR /app

# 3. FIX: Install Git (Required to download specific movie scraper libraries)
RUN apt-get update && apt-get install -y git

# 4. Copy package files first to take advantage of Docker caching
COPY package*.json ./

# 5. Install dependencies (This will now succeed thanks to Git)
RUN npm install

# 6. Copy the rest of your application code
COPY . .

# 7. Tell Railway which port the container uses
EXPOSE 3000

# 8. Start the application
CMD ["npm", "start"]
