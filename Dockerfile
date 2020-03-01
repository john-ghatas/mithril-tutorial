FROM ubuntu
RUN apt-get update && apt-get upgrade 
RUN apt-get install nginx nodejs apt-utils curl -y
RUN curl -L https://npmjs.org/install.sh | sh
RUN cd /var/www/html
WORKDIR /var/www/html
RUN rm /var/www/html/*
COPY . /var/www/html
RUN npm install
RUN npm run build
RUN ls /var/www/html
EXPOSE 80/tcp
CMD [ "npm", "start" ]
