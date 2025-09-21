FROM oven/bun:1

WORKDIR /app


COPY ./packages ./packages
COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./apps/websocket ./apps/websocket

RUN npm install

COPY . .

RUN bun install

RUN BUN run db:generate

EXPOSE 8081

CMD ["bun", "run", "start:websocket"]
