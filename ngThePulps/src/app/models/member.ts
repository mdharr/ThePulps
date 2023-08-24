export class Member {

  id: number;
  name: string;
  description: string;
  imageUrl: string;
  thumbnailUrl: string;

  constructor(
    id: number = 0,
    name: string = '',
    description: string = '',
    imageUrl: string = '',
    thumbnailUrl: string = ''
  ) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.imageUrl = imageUrl;
    this.thumbnailUrl = thumbnailUrl;
  }
}
