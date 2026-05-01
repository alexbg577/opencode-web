FROM oven/bun:1.3.13

WORKDIR /app

COPY bun.lock package.json ./

RUN bun install

COPY packages ./packages

RUN cd packages/app && bun install

COPY . .

RUN cd packages/app && bun run build

EXPOSE 3000

CMD ["bun", "run", "--cwd", "packages/app", "serve"]
