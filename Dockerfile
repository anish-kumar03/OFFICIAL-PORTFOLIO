# Use official lightweight Nginx base image
FROM nginx:alpine

# Remove default nginx static assets to prevent conflicts
RUN rm -rf /usr/share/nginx/html/*

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy all required portfolio files into the Nginx web root
COPY . /usr/share/nginx/html

# Expose port 80 to allow incoming connections
EXPOSE 80

# Run Nginx in the foreground so the container doesn't exit immediately
CMD ["nginx", "-g", "daemon off;"]
