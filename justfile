build:
	docker build --progress=plain --no-cache --rm --tag bun-elysia:1 .

run:
	docker run --env-file .env.development --name bun-elysia --rm -it -p 8080:3000/tcp bun-elysia:1

size:
	docker ps --size | grep "bun-elysia:1" | sed -e "s/.*virtual \(.*\)).*/\1/"
