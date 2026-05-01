FROM oven/bun:1.3.13

WORKDIR /app

# 1. Copy package files (for Docker layer caching)
COPY bun.lock package.json ./

# 2. Copy packages directory BEFORE install (critical for workspace resolution)
COPY packages ./packages

# 3. Now install dependencies (workspaces will be resolved)
RUN bun install

# 4. Copy the rest of the application files
COPY . .

# 5. Build the app
RUN cd packages/app && bun run build

EXPOSE 3000

CMD ["bun", "run", "--cwd", "packages/app", "serve"]
