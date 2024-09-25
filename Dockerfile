FROM oven/bun:1.1.29-alpine as builder

WORKDIR /app

COPY . .

RUN bun install --production --frozen-lockfile

RUN bun build --compile --outfile=eyli src/index.ts

FROM scratch

COPY --from=builder /app/eyli /

ARG PORT
EXPOSE ${PORT:-3000}

CMD ["/eyli"]
