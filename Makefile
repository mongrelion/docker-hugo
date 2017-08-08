HUGO_VERSION := 0.25.1
IMAGE        := mongrelion/hugo
TAG          := $(HUGO_VERSION)
NAME         := $(IMAGE):$(TAG)

default: build

build:
	@echo "-> building image $(NAME)"
	@docker build                              \
		-t $(NAME)                               \
		--build-arg HUGO_VERSION=$(HUGO_VERSION) \
		.

login:
	@echo "-> logging with DockerHUB"
	@docker login -u="$(DOCKER_USER)" -p="$(DOCKER_PASS)"

push:
	@echo "pushing image $(NAME) to DockerHUB"
	@docker push $(NAME)

run:
	@docker run --rm -it $(NAME) version
