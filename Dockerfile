FROM oven/bun:1.1.29-alpine AS builder

WORKDIR /app

COPY . .

RUN bun install --production --frozen-lockfile

RUN bun build --compile --outfile=eyli src/index.ts

FROM oven/bun:1.1.29-alpine

COPY --from=builder /app/eyli /

ARG PORT
EXPOSE ${PORT:-3000}

CMD ["/eyli"]
