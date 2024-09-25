import {Elysia} from 'elysia';

const PORT = Bun.env.PORT;
if (!PORT) {
  throw new Error('No port provided');
}

const app = new Elysia().get('/', () => 'Hello Elysia').listen(PORT);

console.log(
  `>>> Elysia is running at ${app.server?.hostname}:${app.server?.port}`,
);
