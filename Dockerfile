# Use the official Nginx image as the base image
FROM nginx:latest

# Copy everything from the current directory into the Nginx HTML folder
COPY . /usr/share/nginx/html

# Expose port 80 for serving the site
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
