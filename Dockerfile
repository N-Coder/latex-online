# ensure that you copy all static files to ./public before building
# podman build -t ncoder/ipe-web-latex-online:latest -f Dockerfile .
# podman run -d -p 2700:2700 --rm --name latex-online ncoder/ipe-web-latex-online:latest

FROM ncoder/ipe-web-latex-online-base:latest

COPY ./lib /var/www/lib
COPY ./packages /var/www/packages
COPY ./public /var/www/public
COPY ./app.js /var/www/
COPY ./package-lock.json /var/www/
COPY ./package.json /var/www/
COPY ./util/docker-entrypoint.sh /var/www
RUN npm install .

WORKDIR /var/www
EXPOSE 2700
CMD ["/var/www/docker-entrypoint.sh"]
