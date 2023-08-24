export class Artist {

  id: number;
  name: string;
  imageUrl: string;
  description: string;

  constructor(
    id: number = 0,
    name: string = '',
    imageUrl: string = '',
    description: string = ''
  ) {
    this.id = id;
    this.name = name;
    this.imageUrl = imageUrl;
    this.description = description;
  }
}
