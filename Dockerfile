FROM oven/bun:1.3.13

WORKDIR /app

COPY bun.lock package.json ./
COPY packages ./packages

RUN bun install

COPY . .

RUN cd packages/app && bun run build

EXPOSE 3000

CMD ["bun", "run", "--cwd", "packages/app", "serve"]
