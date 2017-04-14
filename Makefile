HUGO_VERSION := 0.20.1
IMAGE        := mongrelion/hugo
TAG          := $(HUGO_VERSION)
NAME         := $(IMAGE):$(TAG)

default: build

build:
	@echo "-> building image $(IMAGE)"
	@docker build                              \
		-t $(NAME)                               \
		--build-arg HUGO_VERSION=$(HUGO_VERSION) \
		.

login:
	@echo "-> logging with DockerHUB"
	@docker login -u="$(DOCKER_USER)" -p="$(DOCKER_PASS)"

push:
	@echo "pushing image $(IMAGE) to DockerHUB"
	@docker push $(NAME)

run:
	@docker run --rm -it $(NAME) version
