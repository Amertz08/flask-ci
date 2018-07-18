DK=docker
IMG=app
PORTS="5000:5000"
NAME=flask_app
HASH=$(shell git rev-parse --short HEAD)
TAG=$(IMG):$(HASH)

build:
	$(DK) build -t=$(IMG) .

run:
	$(DK) run \
	-d \
	--rm \
	-p $(PORTS) \
	--name $(NAME) \
	$(IMG)

test:
	$(DK) run \
	-it \
	--rm \
	-p $(PORTS) \
	--name $(NAME) \
	$(IMG) \
	python test_endpoints.py

stop:
	$(DK) stop $(NAME)

latest:
	$(DK) tag $(IMG) $(TAG)

flake:
	flake8

version:
	echo $(HASH) > version.txt
