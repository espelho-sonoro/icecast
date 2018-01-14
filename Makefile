APP="espelho-sonoro/icecast"
PORT=8080
SOURCE_PASSWORD=source
RELAY_PASSWORD=relay
ADMIN_USER=admin
ADMIN_PASSWORD=admin

build:
	docker build \
		--force-rm \
		--compress \
		--pull \
		--no-cache \
		--tag ${APP} .

run:
	docker run \
		-e PORT=${PORT} \
		-e SOURCE_PASSWORD=${SOURCE_PASSWORD} \
		-e RELAY_PASSWORD=${RELAY_PASSWORD} \
		-e ADMIN_USER=${ADMIN_USER} \
		-e ADMIN_PASSWORD=${ADMIN_PASSWORD} \
		-p 8080:${PORT} \
		${APP}

push:
	heroku container:push ${APP}
