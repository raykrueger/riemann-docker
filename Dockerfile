FROM openjdk:8

RUN curl -s -L -O https://github.com/riemann/riemann/releases/download/0.2.14/riemann-0.2.14.tar.bz2 && \
	tar xvjf riemann-0.2.14.tar.bz2 && \
	cp -r riemann-0.2.14/* /usr/local/ && \
	rm -rf riemann-0.2.14* /usr/local/etc/riemann.config && \
	mkdir -p /usr/local/etc/riemann

COPY /etc/ /usr/local/etc/riemann/

EXPOSE 5555/tcp 5555/udp 5556/tcp

CMD ["/usr/local/bin/riemann", "/usr/local/etc/riemann/riemann.config"]
