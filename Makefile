DK=docker
IMG=app
PORTS="5000:5000"
NAME=flask_app
TAG=$(IMG):$(shell git rev-parse --short HEAD)

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

