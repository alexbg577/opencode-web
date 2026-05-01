FROM oven/bun:1.3.13

WORKDIR /app

COPY bun.lock .
COPY package.json .

RUN bun install

COPY . .

RUN bun run build

EXPOSE 3000

CMD ["bun", "run", "serve"]
