# Use an official Nginx image as the base image
FROM nginx:alpine

# Copy the HTML file to the Nginx default directory
COPY src/index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
