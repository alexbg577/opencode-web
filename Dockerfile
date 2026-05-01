FROM oven/bun:1.3.13

WORKDIR /app

# Copy package files first for Docker layer caching
COPY bun.lock package.json ./

# Copy all packages (needed for workspace resolution)
COPY packages ./packages

# Now install dependencies (workspaces will be resolved)
RUN bun install

# Copy the rest of the application files
COPY . .

# Build the app
RUN cd packages/app && bun run build

EXPOSE 3000

CMD ["bun", "run", "--cwd", "packages/app", "serve"]
