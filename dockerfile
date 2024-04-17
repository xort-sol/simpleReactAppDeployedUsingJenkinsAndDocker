# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React.js application
RUN npm run build

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the application when the container starts
CMD ["npx", "serve", "-s", "build"]
