build:
	docker build -t ansible-in-containers:latest .

run:
	docker run -it --rm --volume /Users/stephane/src/github.com/mgxio/docker-ansible:/ansible -w /ansible ansible-in-containers:latest
