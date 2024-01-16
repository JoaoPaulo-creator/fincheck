import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(new ValidationPipe()); // global pipe, assim sera possivel fazer as validacoes em todos os controllers sem precisar ficar importando um a um
  await app.listen(3000);
}
bootstrap();
