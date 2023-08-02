import { Magazine } from "./magazine";

export class Advertisement {
  id: number;
  magazine: Magazine;
  imageUrl: string;

  constructor(
    id: number = 0,
    magazine: Magazine = new Magazine(),
    imageUrl: string = ''
  ) {
    this.id = id;
    this.magazine = magazine;
    this.imageUrl = imageUrl;
  }
}
