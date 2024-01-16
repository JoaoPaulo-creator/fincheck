import { Global, Module } from '@nestjs/common';
import { PrismaService } from './prisma.service';
import { UserRepository } from './repositories/users.repository';
// passando o decorator Global(), deixo claro para o nest de que esse modulo fica acessivel para todos os demais modulos do projeto
@Global()
@Module({
  providers: [UserRepository, PrismaService],
  exports: [UserRepository],
})
export class DatabaseModule {}
