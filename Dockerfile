# Stage 1: Build the application
FROM node:20-slim AS builder

# Install pnpm
RUN npm install -g pnpm

WORKDIR /app

# Copy package files and install dependencies with pnpm
COPY package.json pnpm-lock.yaml ./
COPY .env.example ./.env
RUN pnpm install --frozen-lockfile

# Copy the rest of the application source code
COPY . .

# Build the project
RUN pnpm run build

# Stage 2: Serve the static files with Nginx
FROM nginx:stable-alpine
# Copy the built assets from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
