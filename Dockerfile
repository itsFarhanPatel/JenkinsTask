# Use the official Nginx image from the Docker Hub
FROM nginx:latest

# Copy the static website files into the Nginx directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]

