FROM oven/bun:1.1.29-alpine

WORKDIR /app

COPY . .

RUN bun install

ARG PORT
EXPOSE ${PORT:-3000}

CMD ["bun", "src/index.ts"]
