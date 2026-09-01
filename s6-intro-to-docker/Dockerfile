FROM nginx

RUN apt-get update && apt-get install vim -y

# COPY source destination
COPY index.html /usr/share/nginx/html/index.html
RUN chown nginx:nginx /usr/share/nginx/html/index.html