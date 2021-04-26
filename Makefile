DOCKER_IMAGE=matrixise/docker-ansible
build:
	docker build -t $(DOCKER_IMAGE):latest .

run:
	docker run -it --rm --volume $(PWD):/ansible -w /ansible $(DOCKER_IMAGE):latest

publish:
	docker push $(DOCKER_IMAGE):latest
