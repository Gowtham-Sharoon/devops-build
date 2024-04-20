FROM nginx:alpine

# Copy the built files to the Nginx directory
COPY build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
