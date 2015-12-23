FROM node:4.2.3
MAINTAINER Dan Lynn <docker@danlynn.org>

# Note: npm is v2.14.7
RUN npm install -g ember-cli@1.13.13
RUN npm install -g bower@1.7.1
RUN npm install -g phantomjs2

# install watchman
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

EXPOSE 4200 35729
WORKDIR /myapp

# run ember server on container start
ENTRYPOINT ["/usr/local/bin/ember"]
CMD ["server"]
