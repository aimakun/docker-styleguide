FROM monostream/nodejs-gulp-bower:latest

EXPOSE 80

COPY . /data
WORKDIR /data/app

RUN npm install
RUN npm install devbridge-styleguide --save-dev
RUN npm install devbridge-styleguide -g
RUN styleguide initialize
RUN gulp start-styleguide
