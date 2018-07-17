DK=docker
IMG=app
PORTS="5000:5000"
NAME=flask_app
TAG=$(IMG):$(shell git rev-parse --short HEAD)

build:
	$(DK) build -t=$(TAG) .
	$(DK) tag $(TAG) $(IMG):latest

run:
	$(DK) run \
	-d \
	--rm \
	-p $(PORTS) \
	--name $(NAME) \
	$(IMG)

stop:
	$(DK) stop $(NAME)
