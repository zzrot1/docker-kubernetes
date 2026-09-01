FROM node:22-alpine

WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies
RUN npm ci 

# Copy the source code to the working directory
COPY src/index.js index.js

# Expose the port that the application will run on
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]