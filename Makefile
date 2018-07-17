DK=docker
IMG=app
PORTS="5000:5000"
NAME=flask_app
TAG=$(IMG):$(shell git rev-parse --short HEAD)

build:
	$(DK) build -t=$(TAG) .

run:
	$(DK) run \
	-d \
	--rm \
	-p $(PORTS) \
	--name $(NAME) \
	$(TAG)

test:
	curl http://localhost:5000

stop:
	$(DK) stop $(NAME)

latest:
	$(DK) tag $(TAG) $(IMG):latest
