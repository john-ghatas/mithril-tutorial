FROM ubuntu

RUN apt-get update && apt-get upgrade 
RUN apt-get install nginx nodejs apt-utils curl -y
RUN curl -L https://npmjs.org/install.sh | sh && cd /var/www/html

WORKDIR /var/www/html

RUN rm /var/www/html/*

COPY . /var/www/html

RUN npm install && npm run build

CMD ["nginx", "-g", "daemon off;"]
RUN service nginx reload

EXPOSE 80
