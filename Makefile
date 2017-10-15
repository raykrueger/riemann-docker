.PHONY: build run shell

repo=raykrueger/riemann

build:
	docker build -t $(repo) .

run: build
	docker run --rm -it -p 5555:5555 -p 5556:5556 $(repo)
