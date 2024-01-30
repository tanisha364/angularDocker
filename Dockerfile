# Build Stage
FROM node:18.17.1 as build

# Set working directory
WORKDIR /app

# Install and cache app dependencies
RUN npm install -g @angular/cli@8.2.0 --save-dev

# Add app
COPY . /app

# Generate build
RUN ng build --output-path=dist

# Production Stage
FROM nginx:1.16.0-alpine

# Copy artifact build from the 'build environment'
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 (default for HTTP)
EXPOSE 4200

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
