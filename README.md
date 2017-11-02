# riemann-docker

Reimann in a container

## Building

    git clone https://github.com/raykrueger/riemann-docker.git
    make build

or without `make`:

    git clone https://github.com/raykrueger/riemann-docker.git
    docker build -t raykrueger/riemann .

## Running Local

    make run

Or without `make`:

    docker run --rm -it -p 5555:5555 -p 5556:5556 raykrueger/riemann

## Configuration

The configuration can be overwritten by mounting a new config file at
`/usr/local/etc/riemann/riemann.conf`.

For example...

    docker run -v /etc/riemann.config:/usr/local/etc/riemann/riemann.config \
    --rm -it -p 5555:5555 -p 5556:5556 raykrueger/riemann

Alternatively, you can start your own Docker image FROM this repo and just
overwrite the file entirely.

    FROM raykrueger/riemann
    COPY riemann.config /usr/local/etc/riemann/riemann.config

The default image exposes port 5555 for both TCP and UDP, as well as port 5556
for websockets. Unless you're running the riemann web application you can leave off port 5556.
