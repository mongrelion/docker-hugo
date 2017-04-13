HUGO_VERSION := 0.20.1
IMAGE        := mongrelion/hugo
TAG          := $(HUGO_VERSION)
NAME         := $(IMAGE):$(TAG)

build:
	@docker build                              \
		-t $(NAME)                               \
		--build-arg HUGO_VERSION=$(HUGO_VERSION) \
		.

run:
	@docker run --rm -it $(NAME) version
