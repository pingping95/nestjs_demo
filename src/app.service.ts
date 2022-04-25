import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return `DB HOST : ${process.env.DATABASE_HOST}`;
  }
}
