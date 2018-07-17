DK=docker
IMG=app
PORTS="5000:5000"
NAME=flask_app

build:
	$(DK) build -t=$(IMG) .

run:
	$(DK) run \
	-d \
	--rm \
	-p $(PORTS) \
	--name $(NAME) \
	$(IMG)

stop:
	$(DK) stop $(NAME)
