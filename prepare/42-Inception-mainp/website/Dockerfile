FROM debian:bookworm

#RUN apt-get update && apt-get install -y nodejs
#RUN apt-get install -y npm
RUN apt-get update && apt-get install -y python3

RUN mkdir -p /var/www/html

COPY index.html /var/www/html
#COPY package.json /var/www/html/me
#COPY server.js /var/www/html/me

EXPOSE 1313

WORKDIR /var/www/html

#RUN npm install

#CMD ["npm", "start"]
CMD ["python3", "-m", "http.server", "1313"]
