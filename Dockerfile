# Use official Nginx image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy all files (HTML/CSS/images) to nginx html directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 4100

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]


