FROM monostream/nodejs-gulp-bower:latest

EXPOSE 80

COPY . /data
WORKDIR /data/app

RUN cd $(npm root -g)/npm \
 && npm install fs-extra \
 && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs\.move/ ./lib/utils/rename.js

RUN npm install
RUN npm install gulp
RUN npm install devbridge-styleguide --save-dev
RUN npm install devbridge-styleguide -g
RUN styleguide initialize
RUN gulp start-styleguide
